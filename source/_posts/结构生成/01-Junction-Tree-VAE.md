---
title: Junction Tree VAE：开创性图生成
mathjax: true
date: 2026-08-24 12:00:00
tags: [机器学习, 分子生成, VAE, 图神经网络]
categories: 结构生成
cover:
---

# Junction Tree VAE：开创性图生成

## 论文信息

- **标题**: Junction Tree Variational Autoencoder for Molecular Graph Generation
- **作者**: Wengong Jin, Regina Barzilay, Tommi Jaakkola
- **年份**: 2018
- **会议**: ICML 2018
- **引用量**: 2000+

---

## 核心思想

Junction Tree VAE (JT-VAE) 的核心思想是：**分子图的两阶段生成**：
1. **生成子结构树**：先生成一个树结构，表示化学子结构（如环、官能团）的组装顺序
2. **组装分子图**：用图消息传递网络将子结构组装成完整的分子图

这种方法保证了**每一步都产生化学有效的分子**。

---

## 方法详解

### 1. 分子图表示

**分子图**：
$$G = (V, E), \quad V = \{\text{原子}\}, E = \{\text{化学键}\}$$

**团树分解**：
将分子图分解为团（clique）组成的树结构：
$$G \rightarrow \mathcal{T} = (V_{\mathcal{T}}, E_{\mathcal{T}})$$

### 2. 编码器

**分子图 → 团树 → 隐空间**

$$q_{\phi}(z | G) = q_{\phi}(z | \mathcal{T}) = \prod_{v \in V_{\mathcal{T}}} q_{\phi}(z_v | \mathcal{T})$$

使用图消息传递网络编码团树：
$$h_v^{(l+1)} = \text{READ}\left(h_v^{(l)}, \{h_u^{(l)} : u \in \mathcal{N}(v)\}\right)$$

### 3. 解码器

**隐空间 → 团树 → 分子图**

**解码团树**：
$$p_{\theta}(\mathcal{T}) = \prod_{v \in V_{\mathcal{T}}} p_{\theta}(v | \text{parent}(v), z)$$

**组装分子图**：
给定团树，用消息传递网络组装分子图：
$$m_{ij} = \text{ATT}(h_i, h_j, e_{ij})$$
$$h_i^{(l+1)} = \text{UPDATE}(h_i^{(l)}, \sum_j m_{ij})$$

### 4. 训练目标

**变分下界（ELBO）**：
$$\mathcal{L} = \mathbb{E}_{q_{\phi}(z|G)}[\log p_{\theta}(G|z)] - \beta D_{KL}(q_{\phi}(z|G) \| p(z))$$

---

## 代码示例

```python
import torch
import torch.nn as nn
from torch_geometric.nn import GINConv, global_add_pool

class MolecularEncoder(nn.Module):
    """分子图编码器"""
    
    def __init__(self, input_dim, hidden_dim, latent_dim):
        super().__init__()
        
        # 图神经网络
        self.gnn = GINConv(
            nn.Sequential(
                nn.Linear(input_dim, hidden_dim),
                nn.ReLU(),
                nn.Linear(hidden_dim, hidden_dim)
            )
        )
        
        # 团池化
        self.pool = global_add_pool
        
        # 隐空间映射
        self.mu_layer = nn.Linear(hidden_dim, latent_dim)
        self.logvar_layer = nn.Linear(hidden_dim, latent_dim)
    
    def forward(self, x, edge_index, batch):
        """编码分子图"""
        # GNN编码
        h = self.gnn(x, edge_index)
        
        # 图级表示
        h_pool = self.pool(h, batch)
        
        # 隐空间参数
        mu = self.mu_layer(h_pool)
        logvar = self.logvar_layer(h_pool)
        
        return mu, logvar

class JunctionTreeDecoder(nn.Module):
    """Junction Tree解码器"""
    
    def __init__(self, latent_dim, hidden_dim, num_substructures):
        super().__init__()
        
        # 子结构嵌入
        self.substructure_embedding = nn.Embedding(
            num_substructures, hidden_dim
        )
        
        # RNN解码树结构
        self.tree_rnn = nn.GRU(
            hidden_dim, hidden_dim, batch_first=True
        )
        
        # 子结构选择
        self.substructure_predictor = nn.Linear(
            hidden_dim, num_substructures
        )
        
        # 图组装网络
        self.assembly_gnn = GINConv(
            nn.Sequential(
                nn.Linear(hidden_dim, hidden_dim),
                nn.ReLU(),
                nn.Linear(hidden_dim, hidden_dim)
            )
        )
    
    def decode_tree(self, z, max_nodes=10):
        """解码团树"""
        batch_size = z.shape[0]
        
        # 初始状态
        h = z.unsqueeze(1)  # (batch, 1, latent_dim)
        
        tree_nodes = []
        
        for _ in range(max_nodes):
            # 预测下一个子结构
            logits = self.substructure_predictor(h[:, -1, :])
            probs = torch.softmax(logits, dim=-1)
            
            # 采样
            next_node = torch.multinomial(probs, 1).squeeze(-1)
            tree_nodes.append(next_node)
            
            # RNN更新
            next_embed = self.substructure_embedding(next_node)
            h_new, _ = self.tree_rnn(next_embed.unsqueeze(1), h.transpose(0, 1))
            h = torch.cat([h, h_new.transpose(0, 1)], dim=1)
        
        return torch.stack(tree_nodes, dim=1)
    
    def assemble_molecule(self, tree_nodes, z):
        """组装分子图"""
        # 获取子结构表示
        h = self.substructure_embedding(tree_nodes)
        
        # 融合隐空间信息
        h = h + z.unsqueeze(1)
        
        # 图组装GNN
        # 这里简化处理，实际需要构建分子图
        return h

class JTVAE(nn.Module):
    """Junction Tree VAE"""
    
    def __init__(self, input_dim, hidden_dim, latent_dim, num_substructures):
        super().__init__()
        
        self.encoder = MolecularEncoder(
            input_dim, hidden_dim, latent_dim
        )
        
        self.decoder = JunctionTreeDecoder(
            latent_dim, hidden_dim, num_substructures
        )
    
    def reparameterize(self, mu, logvar):
        """重参数化技巧"""
        std = torch.exp(0.5 * logvar)
        eps = torch.randn_like(std)
        return mu + eps * std
    
    def forward(self, data):
        """前向传播"""
        # 编码
        mu, logvar = self.encoder(
            data.x, data.edge_index, data.batch
        )
        
        # 重参数化
        z = self.reparameterize(mu, logvar)
        
        # 解码树结构
        tree_nodes = self.decoder.decode_tree(z)
        
        # 组装分子
        molecule = self.decoder.assemble_molecule(tree_nodes, z)
        
        return molecule, mu, logvar

def vae_loss(recon, data, mu, logvar, beta=1.0):
    """VAE损失函数"""
    # 重构损失
    recon_loss = nn.MSELoss()(recon, data.x)
    
    # KL散度
    kl_loss = -0.5 * torch.sum(1 + logvar - mu.pow(2) - logvar.exp())
    
    return recon_loss + beta * kl_loss
```

---

## 关键创新

### 1. 两阶段生成
- **树生成**：保证子结构有效性
- **图组装**：保证化学有效性

### 2. 团树分解
- 处理环状结构
- 层次化表示
- 简化生成过程

### 3. 消息传递组装
- 聚合子结构信息
- 保持局部化学规则
- 保证分子有效性

---

## 实验结果

### 1. 分子生成质量

| 方法 | 有效性 | 新颖性 | 多样性 |
|------|--------|--------|--------|
| SMILES-RNN | 78.4% | 85.2% | 92.1% |
| JT-VAE | 100% | 98.5% | 95.3% |

**JT-VAE保证100%有效性**

### 2. 分子优化

在优化任务中（优化logP）：
- JT-VAE提升1.21 logP单位
- 基线方法仅提升0.8 logP单位

### 3. 类药性

生成的分子在类药性指标上与训练集相当。

---

## 优势与局限

### 优势
1. **100%有效性**：保证化学有效性
2. **处理环结构**：团树自然处理环
3. **可解释性**：树结构有化学意义

### 局限
1. **预定义子结构**：依赖子结构词典
2. **生成速度**：两阶段较慢
3. **3D信息缺失**：仅生成2D图

---

## 后续发展

JT-VAE启发了大量后续工作：
- **GraphVAE**：直接生成图
- **GraphAF**：流式自回归生成
- **REINVENT**：强化学习分子生成
- **EDM**：3D等变扩散

---

## 参考文献

1. Jin, W., Barzilay, R. & Jaakkola, T. Junction Tree Variational Autoencoder for Molecular Graph Generation. *Proceedings of the 35th International Conference on Machine Learning*, 2018, 80, 2323-2332.
2. Simonovsky, M. & Komodakis, N. GraphVAE: Towards Generation of Small Graphs Using Variational Autoencoders. *arXiv:1802.03480*, 2018.
3. Shi, C. et al. GraphAF: a Flow-based Autoregressive Model for Molecular Graph Generation. *arXiv:2001.09382*, 2020.
