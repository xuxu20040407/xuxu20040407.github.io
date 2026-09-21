import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rcParams

d = 20
rng = np.random.default_rng(42)
Q, _ = np.linalg.qr(rng.standard_normal((d, d)))
eigs = np.geomspace(1.0, 400.0, d)
A = Q @ np.diag(eigs) @ Q.T
loss = lambda w: 0.5 * w @ A @ w
start = rng.standard_normal(d) * 5
N = 500

def adagrad(n, lr, eps=1e-8):
    w = start.copy(); v = np.zeros(d); ls = []; ss = []
    for _ in range(n):
        g = A @ w; v += g*g; w_old = w.copy()
        dw = -lr*g/(np.sqrt(v)+eps); w = w + dw
        ls.append(loss(w)); ss.append(np.linalg.norm(w - w_old))
    return np.array(ls), np.array(ss)

def rmsprop(n, lr, b2=0.99, eps=1e-8):
    w = start.copy(); v = np.zeros(d); ls = []; ss = []
    for _ in range(n):
        g = A @ w; v = b2*v + (1-b2)*g*g; w_old = w.copy()
        dw = -lr*g/(np.sqrt(v)+eps); w = w + dw
        ls.append(loss(w)); ss.append(np.linalg.norm(w - w_old))
    return np.array(ls), np.array(ss)

def adam(n, lr, b1=0.9, b2=0.99, eps=1e-8):
    w = start.copy(); m = np.zeros(d); v = np.zeros(d); ls = []; ss = []
    for t in range(1, n+1):
        g = A @ w; m = b1*m + (1-b1)*g; v = b2*v + (1-b2)*g*g
        mh = m/(1-b1**t); vh = v/(1-b2**t); w_old = w.copy()
        dw = -lr*mh/(np.sqrt(vh)+eps); w = w + dw
        ls.append(loss(w)); ss.append(np.linalg.norm(w - w_old))
    return np.array(ls), np.array(ss)

def adamw(n, lr, wd=0.01, b1=0.9, b2=0.99, eps=1e-8):
    w = start.copy(); m = np.zeros(d); v = np.zeros(d); ls = []; ss = []
    for t in range(1, n+1):
        g = A @ w; m = b1*m + (1-b1)*g; v = b2*v + (1-b2)*g*g
        mh = m/(1-b1**t); vh = v/(1-b2**t); w_old = w.copy()
        dw = -lr*mh/(np.sqrt(vh)+eps)
        w = w*(1 - lr*wd) + dw               # 解耦权重衰减
        ls.append(loss(w)); ss.append(np.linalg.norm(w - w_old))
    return np.array(ls), np.array(ss)

ls_a, ss_a = adagrad(N, 0.5)
ls_r, ss_r = rmsprop(N, 0.1)
ls_m, ss_m = adam(N, 0.2)
ls_w, ss_w = adamw(N, 0.2)

rcParams.update({"figure.facecolor":"#1e1e2e","axes.facecolor":"#1e1e2e",
    "text.color":"white","axes.edgecolor":"#555577","axes.labelcolor":"white"})
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 5.5), dpi=130)
steps = np.arange(1, N+1)
styles = [("AdaGrad", ls_a, ss_a, "#e85d75"),
          ("RMSProp", ls_r, ss_r, "#4a90d9"),
          ("Adam",    ls_m, ss_m, "#4cd964"),
          ("AdamW",   ls_w, ss_w, "#e6c84d")]
for (name, ls, ss, color) in styles:
    ax1.semilogy(steps, ls, color=color, linewidth=2, label=name)
    ax2.semilogy(steps, ss, color=color, linewidth=2, label=name)
ax1.set_title("Loss", fontsize=15, fontweight="bold", pad=10)
ax1.set_xlabel("step", fontsize=10, color="#aaaaaa"); ax1.set_ylabel("loss", fontsize=11)
ax1.legend(fontsize=9, facecolor="#2a2a3e", edgecolor="#555577", labelcolor="white")
ax1.tick_params(colors="#888899"); ax1.grid(True, alpha=0.15, color="#444466")
ax2.set_title(r"Step size  $\|\Delta w\|$", fontsize=15, fontweight="bold", pad=10)
ax2.set_xlabel("step", fontsize=10, color="#aaaaaa"); ax2.set_ylabel(r"$\|\Delta w\|$", fontsize=11)
ax2.legend(fontsize=9, facecolor="#2a2a3e", edgecolor="#555577", labelcolor="white")
ax2.tick_params(colors="#888899"); ax2.grid(True, alpha=0.15, color="#444466")
fig.suptitle("Adaptive methods: AdaGrad / RMSProp / Adam / AdamW  (d=20,  $\\kappa=400$)",
             fontsize=14, fontweight="bold", color="white", y=1.02)
plt.tight_layout()
import os
out = r"D:\Blog\xuxu20040407.github.io\source\img\机器学习分子力场\fig_adaptive_methods.png"
plt.savefig(out, facecolor=fig.get_facecolor(), dpi=130, bbox_inches="tight")
print("saved:", out, "size:", os.path.getsize(out))
