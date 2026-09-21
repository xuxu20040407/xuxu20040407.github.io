import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rcParams

d = 20
rng = np.random.default_rng(42)
Q, _ = np.linalg.qr(rng.standard_normal((d, d)))
eigs = np.geomspace(1.0, 400.0, d)
A = Q @ np.diag(eigs) @ Q.T
loss_fn = lambda w: 0.5 * w @ A @ w
grad_fn = lambda w: A @ w
start = rng.standard_normal(d) * 5
sigma, N, lr = 1.0, 2000, 0.2

def s_const(t, n): return 1.0
def s_linear(t, n): return max(0, 1 - t/n)
def s_cosine(t, n): return 0.5*(1 + np.cos(np.pi * t/n))
def s_step(t, n): return 0.5 ** (t // (n//4))
def s_cw(t, n):
    f = t / n
    return f/0.1 if f < 0.1 else 0.5*(1 + np.cos(np.pi*(f-0.1)/0.9))
def s_wsd(t, n):
    f = t / n
    if f < 0.1: return f/0.1
    if f < 0.8: return 1.0
    return 0.5*(1 + np.cos(np.pi*(f-0.8)/0.2))

def adam_sched(sched, n=N):
    rng2 = np.random.default_rng(0)
    w = start.copy(); m = np.zeros(d); v = np.zeros(d); ls = []
    for t in range(1, n+1):
        eta = lr * sched(t, n)
        g = grad_fn(w) + sigma * rng2.standard_normal(d)
        m = 0.9*m + 0.1*g; v = 0.99*v + 0.01*g*g
        mh = m/(1 - 0.9**t); vh = v/(1 - 0.99**t)
        w = w - eta * mh / (np.sqrt(vh) + 1e-8); ls.append(loss_fn(w))
    return np.array(ls)

# Schedule-Free: three sequences (z, x, y) with beta + decay
def sf_adam(beta=0.95, decay=0.99, n=N):
    rng2 = np.random.default_rng(0)
    z = start.copy(); x = start.copy(); y = start.copy()
    m = np.zeros(d); v = np.zeros(d); ls = []
    for t in range(1, n+1):
        g = grad_fn(z) + sigma * rng2.standard_normal(d)  # gradient at z
        m = 0.9*m + 0.1*g; v = 0.99*v + 0.01*g*g
        mh = m/(1 - 0.9**t); vh = v/(1 - 0.99**t)
        z = z - lr * mh / (np.sqrt(vh) + 1e-8)             # fast iterate
        x = decay*x + (1-decay)*z                          # EMA -> slow output
        y = (1-beta)*z + beta*x                             # interpolation
        ls.append(loss_fn(y))
    return np.array(ls)

rcParams.update({"figure.facecolor":"#1e1e2e","axes.facecolor":"#1e1e2e",
    "text.color":"white","axes.edgecolor":"#555577","axes.labelcolor":"white"})
fig, ax = plt.subplots(figsize=(10, 5.5), dpi=130)
steps = np.arange(1, N+1)
sched_styles = [("Constant", s_const, "#888899", "-"),
                ("Linear",    s_linear, "#4a90d9", "-"),
                ("Cosine",    s_cosine, "#4cd964", "-"),
                ("Step (x0.5/25%)", s_step, "#e85d75", "--"),
                ("Cosine+Warmup(10%)", s_cw, "#e6c84d", "-"),
                ("WSD (10/70/20)", s_wsd, "#b388ff", "-")]
for (name, fn, color, ls) in sched_styles:
    ls_curve = adam_sched(fn)
    ax.semilogy(steps, ls_curve, color=color, linewidth=2, linestyle=ls, label=name)
ls_sf = sf_adam()
ax.semilogy(steps, ls_sf, color="#ff79c6", linewidth=2.5, linestyle="-", label="Schedule-Free")
ax.set_xlabel("step", fontsize=12, color="#aaaaaa"); ax.set_ylabel("loss", fontsize=13)
ax.set_title(rf"Adam on ill-conditioned quadratic ($d={d}$, $\kappa={int(eigs[-1])}$, noise $\sigma={sigma}$)",
             fontsize=14, fontweight="bold", pad=12)
ax.legend(fontsize=8.5, facecolor="#2a2a3e", edgecolor="#555577", labelcolor="white")
ax.tick_params(colors="#888899"); ax.grid(True, alpha=0.15, color="#444466")
ax.annotate("SF starts slow\n(averaging warms up)", xy=(300, 600), xytext=(600, 50),
            fontsize=9, color="#ff79c6", ha="center",
            arrowprops=dict(arrowstyle="->", color="#ff79c6", lw=1.5))
ax.annotate("SF finishes best\n$3.7\\times10^{-3}$", xy=(1900, 0.004), xytext=(1400, 0.0003),
            fontsize=9, color="#ff79c6", ha="center",
            arrowprops=dict(arrowstyle="->", color="#ff79c6", lw=1.5))
plt.tight_layout()
out = r"D:\Blog\xuxu20040407.github.io\source\img\机器学习分子力场\fig_schedule_loss.png"
plt.savefig(out, facecolor=fig.get_facecolor(), dpi=130, bbox_inches="tight")
print("saved:", out)
import os; print("size:", os.path.getsize(out))
