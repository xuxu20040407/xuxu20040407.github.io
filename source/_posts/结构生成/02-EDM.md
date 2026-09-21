---
title: EDM：等变扩散3D分子生成
mathjax: true
date: 2026-08-24 12:00:00
tags: [机器学习, 分子生成, 扩散模型, 3D]
categories: 结构生成
cover:
---

# EDM：等变扩散3D分子生成

## 论文信息

- **标题**: Equivariant Diffusion for Molecule Generation in 3D
- **作者**: Emiel Hoogeboom, Victor Garcia Satorras, Clément Vignac, Max Welling
- **年份**: 2022
- **会议**: ICML 2022
- **引用量**: 800+

---

## 核心思想

EDM (Equivariant Diffusion Model) 的核心思想是：**在3D坐标空间中进行等变扩散**，通过在SE(3)群下保持等变性的扩散过程，生成具有正确3D结构的分子。

$$x_{t-1} = \mu_{\theta}(x_t, t) + \sigma_t \epsilon, \quad \epsilon \sim \mathcal{N}(0, I)$$

---

## 方法详解

### 1. 分子3D表示

分子3D结构包含：
- **原子类型**：$z = (z_1, \ldots, z_N)$
- **原子坐标**：$x = (x_1, \ldots, x_N) \in \mathbb{R}^{N \times 3}$

### 2. 等变扩散过程

**前向过程**（添加噪声）：
$$q(x_t | x_{t-1}) = \mathcal{N}(x_t; \sqrt{\alpha_t} x_{t-1}, (1-\alpha_t) I)$$

**等变性要求**：
$$q(g \cdot x_t | g \cdot x_{t-1}) = q(x_t | x_{t-1}), \quad g \in SE(3)$$

### 3. 等变神经网络

**网络架构**：
$$\mu_{\theta}(x_t, t) = \text{EquivariantNetwork}(x_t, t)$$

**等变性**：
$$\mu_{\theta}(g \cdot x, t) = g \cdot \mu_{\theta}(x, t)$$

### 4. 原子类型生成

原子类型通过分类模型生成：
$$p_{\theta}(z | x) = \prod_{i=1}^N p_{\theta}(z_i | x)$$

---

## 代码示例

```python
import torch
import torch.nn as nn
from e3nn import o3
from e3nn.nn import GatedMLP

class EquivariantNetwork(nn.Module):
    """等变神经网络"""
    
    def __init__(self, irreps_in, irreps_hidden, irreps_out, num_layers=4):
        super().__init__()
        
        # 等变卷积层
        self.layers = nn.ModuleList()
        irreps_current = irreps_in
        
        for _ in range(num_layers):
            layer = o3.Convolution(
                irreps_current, irreps_hidden, irreps_hidden
            )
            self.layers.append(layer)
            irreps_current = irreps_hidden
        
        # 输出层
        self.output = o3.Linear(irreps_hidden, irreps_out)
    
    def forward(self, x, edge_index, edge_attr, t):
        """等变前向传播"""
        # 时间嵌入
        t_embed = self.time_embed(t)
        
        # 等变卷积
        for layer in self.layers:
            x = layer(x, edge_index, edge_attr)
            x = x + t_embed  # 融合时间信息
        
        return self.output(x)

class EDM(nn.Module):
    """等变扩散模型"""
    
    def __init__(self, num_atom_types=100, hidden_dim=64, num_steps=1000):
        super().__init__()
        
        self.num_atom_types = num_atom_types
        self.num_steps = num_steps
        
        # 坐标去噪网络
        self.coordinate_net = EquivariantNetwork(
            irreps_in='1x1o',
            irreps_hidden=f'{hidden_dim}x0e+{hidden_dim//2}x1o',
            irreps_out='1x1o'
        )
        
        # 原子类型分类网络
        self.atom_type_net = nn.Sequential(
            nn.Linear(hidden_dim, hidden_dim),
            nn.SiLU(),
            nn.Linear(hidden_dim, num_atom_types)
        )
        
        # 时间嵌入
        self.time_embed = nn.Sequential(
            nn.Linear(1, hidden_dim),
            nn.SiLU(),
            nn.Linear(hidden_dim, hidden_dim)
        )
        
        # 调度参数
        self.betas = torch.linspace(1e-4, 0.02, num_steps)
        self.alphas = 1 - self.betas
        self.alpha_bar = torch.cumprod(self.alphas, dim=0)
    
    def forward_diffusion(self, x0, t):
        """前向扩散过程"""
        noise = torch.randn_like(x0)
        alpha_bar_t = self.alpha_bar[t].view(-1, 1, 1)
        
        xt = torch.sqrt(alpha_bar_t) * x0 + torch.sqrt(1 - alpha_bar_t) * noise
        
        return xt, noise
    
    def reverse_step(self, xt, t, edge_index):
        """反向去噪步骤"""
        # 时间嵌入
        t_embed = self.time_embed(t.view(-1, 1).float())
        
        # 预测噪声
        noise_pred = self.coordinate_net(xt, edge_index, None, t_embed)
        
        # 计算均值
        alpha_t = self.alphas[t].view(-1, 1, 1)
        alpha_bar_t = self.alpha_bar[t].view(-1, 1, 1)
        
        mean = (xt - (1 - alpha_t) / torch.sqrt(1 - alpha_bar_t) * noise_pred)
        mean = mean / torch.sqrt(alpha_t)
        
        # 添加噪声（训练时）
        if self.training:
            noise = torch.randn_like(xt)
            std = torch.sqrt((1 - alpha_bar_t) / (1 - alpha_bar_t + 1e-8))
            return mean + std * noise
        else:
            return mean
    
    def generate(self, num_molecules, num_atoms, edge_index):
        """生成分子"""
        # 从噪声开始
        x = torch.randn(num_molecules, num_atoms, 3)
        
        # 逐步去噪
        for t in reversed(range(self.num_steps)):
            t_tensor = torch.full((num_molecules,), t, device=x.device)
            x = self.reverse_step(x, t_tensor, edge_index)
        
        return x
    
    def training_loss(self, x0, edge_index):
        """计算训练损失"""
        batch_size = x0.shape[0]
        
        # 随机采样时间步
        t = torch.randint(0, self.num_steps, (batch_size,), device=x0.device)
        
        # 前向扩散
        xt, noise = self.forward_diffusion(x0, t)
        
        # 预测噪声
        t_embed = self.time_embed(t.view(-1, 1).float())
        noise_pred = self.coordinate_net(xt, edge_index, None, t_embed)
        
        # MSE损失
        loss = nn.MSELoss()(noise_pred, noise)
        
        return loss

def train_edm(model, train_loader, epochs=100):
    """训练EDM模型"""
    optimizer = torch.optim.Adam(model.parameters(), lr=1e-4)
    
    for epoch in range(epochs):
        total_loss = 0
        
        for batch in train_loader:
            # 前向传播
            loss = model.training_loss(
                batch['positions'],
                batch['edge_index']
            )
            
            # 反向传播
            optimizer.zero_grad()
            loss.backward()
            torch.nn.utils.clip_grad_norm_(model.parameters(), 1.0)
            optimizer.step()
            
            total_loss += loss.item()
        
        if (epoch + 1) % 10 == 0:
            print(f"Epoch {epoch+1}, Loss: {total_loss:.6f}")
```

---

## 关键创新

### 1. 3D等变扩散
- 在SE(3)群下保持等变性
- 生成正确的3D结构
- 保持旋转不变性

### 2. 联合生成
- 同时生成坐标和原子类型
- 端到端训练
- 条件生成能力

### 3. 高效采样
- 可控的去噪步数
- 并行生成多个分子
- 可调生成质量

---

## 与其他方法的对比

| 方法 | 3D支持 | 等变性 | 生成质量 | 速度 |
|------|--------|--------|----------|------|
| JT-VAE | 否 | 无 | 中 | 快 |
| GraphAF | 否 | 无 | 中 | 中 |
| EDM | 是 | 是 | 高 | 中 |
| GeoDiff | 是 | 是 | 高 | 慢 |

---

## 实验结果

### 1. QM9数据集

在QM9数据集上：
- 有效性：98.5%
- 新颖性：97.2%
- 3D结构合理性：高

### 2. 分子性质

生成的分子性质分布与训练集匹配：
- 偶极矩
- HOMO-LUMO能隙
- 分子量

### 3. 条件生成

可以进行条件生成：
- 指定原子类型分布
- 指定分子大小
- 指定口袋条件

---

## 总结

EDM是3D分子生成的开创性工作，它：
- 首次实现SE(3)等变扩散
- 高质量3D分子生成
- 奠定了3D生成模型的基础

后续工作TargetDiff、DecompDiff等都是在EDM基础上的改进。

---

## 参考文献

1. Hoogeboom, E. et al. Equivariant Diffusion for Molecule Generation in 3D. *Proceedings of the 39th International Conference on Machine Learning*, 2022, 163, 8867-8882.
2. Xu, M. et al. GeoDiff: A Geometric Diffusion Model for Molecular Conformation Generation. *arXiv:2203.04610*, 2022.
3. Guan, J. et al. 3D Equivariant Diffusion for Target-Aware Molecule Generation and Affinity Prediction. *arXiv:2303.03543*, 2023.
