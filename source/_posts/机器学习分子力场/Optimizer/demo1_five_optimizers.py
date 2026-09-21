import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rcParams

th = np.deg2rad(30)
Q = np.array([[np.cos(th), -np.sin(th)], [np.sin(th), np.cos(th)]])
A = Q @ np.diag([20.0, 1.0]) @ Q.T
loss = lambda w: 0.5 * w @ A @ w
w0 = np.array([8.0, 8.0])

def newton_schulz(G, steps=5):
    a, b, c = 3.4445, -4.7750, 2.0315
    X = np.asarray(G, dtype=np.float32); X /= (np.linalg.norm(X) + 1e-7)
    tr = X.shape[0] > X.shape[1]
    if tr: X = X.T
    for _ in range(steps):
        A1 = X @ X.T; X = a*X + b*(A1@X) + c*(A1@A1)@X
    return (X.T if tr else X).astype(np.float64)

def sgd(g, st):     return -st["lr"] * g
def momentum(g, st): st["m"] = st["mu"]*st["m"] + g; return -st["lr"] * st["m"]
def adam(g, st):
    st["t"] += 1; st["m"] = 0.9*st["m"] + 0.1*g; st["v"] = 0.999*st["v"] + 0.001*g*g
    mh = st["m"]/(1-0.9**st["t"]); vh = st["v"]/(1-0.999**st["t"])
    return -st["lr"] * mh/(np.sqrt(vh)+1e-8)
def muon(g, st):
    st["buf"] = 0.95*st["buf"] + g; gn = g + 0.95*st["buf"]
    O = newton_schulz(gn[None, :]); return -st["lr"] * O.ravel()
def soap(g, st):
    st["R"] += np.outer(g, g)
    if st["t"] % 10 == 0: _, st["Qb"] = np.linalg.eigh(st["R"])
    Qb = st["Qb"]; gr = g @ Qb; st["t"] += 1
    st["m"] = 0.9*st["m"] + 0.1*gr; st["v"] = 0.999*st["v"] + 0.001*gr*gr
    mh = st["m"]/(1-0.9**st["t"]); vh = st["v"]/(1-0.999**st["t"])
    return -st["lr"] * ((mh/(np.sqrt(vh)+1e-8)) @ Qb.T)

runs = {"SGD":      (sgd,      {"lr": 0.02}),
        "Momentum": (momentum, {"lr": 0.002, "mu": 0.9, "m": np.zeros(2)}),
        "Adam":     (adam,     {"lr": 0.3, "m": np.zeros(2), "v": np.zeros(2), "t": 0}),
        "Muon":     (muon,     {"lr": 0.15, "buf": np.zeros(2)}),
        "SOAP":     (soap,     {"lr": 0.25, "R": np.zeros((2,2)), "Qb": np.eye(2),
                               "m": np.zeros(2), "v": np.zeros(2), "t": 0})}

def train(fn, st, n_steps=250, sigma=4.0, seed=0):
    rng = np.random.default_rng(seed); ws = [w0.copy()]; w = w0.copy()
    for k in range(n_steps):
        f = k/n_steps
        sched = f/0.1 if f < 0.1 else 0.5*(1+np.cos(np.pi*(f-0.1)/0.9))
        g = A@w + sigma*rng.standard_normal(2)
        w = w + sched*fn(g, st); ws.append(w.copy())
    return np.array(ws)

trajs = {name: train(fn, st) for name, (fn, st) in runs.items()}

rcParams.update({"figure.facecolor":"#1e1e2e","axes.facecolor":"#1e1e2e",
    "text.color":"white","axes.edgecolor":"#555577","axes.labelcolor":"white"})
fig, ax = plt.subplots(figsize=(9, 7.5), dpi=130)
xx = np.linspace(-10, 10, 400); yy = np.linspace(-10, 10, 400)
X, Y = np.meshgrid(xx, yy); Z = 0.5*(20*(X*np.cos(th)+Y*np.sin(th))**2 + 1*(-X*np.sin(th)+Y*np.cos(th))**2)
ax.contour(X, Y, Z, levels=np.logspace(-1, 3, 30), colors="#444466", linewidths=0.6, alpha=0.7)
styles = [("SGD","gray","--",1.5), ("Momentum","#4a90d9","-",1.8),
          ("Adam","#e8913a","-",1.8), ("Muon","#e85d75","-",1.8), ("SOAP","#4cd964","-",2.0)]
for (name,color,ls,lw) in styles:
    p = trajs[name]
    ax.plot(p[:,0], p[:,1], color=color, linestyle=ls, linewidth=lw, zorder=3)
    ax.scatter([p[-1,0]],[p[-1,1]], color=color, s=25, zorder=4)
ax.scatter([w0[0]],[w0[1]], marker="o", color="#e6c84d", s=100, zorder=5)
ax.text(w0[0]+0.3, w0[1]+0.3, "start", color="#e6c84d", fontsize=11, fontweight="bold")
ax.scatter([0],[0], marker="*", color="white", s=240, zorder=5)
ax.text(0.3, -0.5, "minimum", color="white", fontsize=10)
ax.set_title("Five optimizers on a rotated ravine  ($\\kappa=20$, noise $\\sigma=4$)",
             fontsize=14, fontweight="bold", pad=12)
ax.set_xlabel("$w_1$", fontsize=11); ax.set_ylabel("$w_2$", fontsize=11)
ax.set_xlim(-10, 10); ax.set_ylim(-10, 10); ax.set_aspect("equal"); ax.grid(False)
handles = [plt.Line2D([0],[0],color=c,linestyle=l,linewidth=2,label=n) for (n,c,l,lw) in styles]
ax.legend(handles=handles, fontsize=9, facecolor="#2a2a3e", edgecolor="#555577", labelcolor="white", loc="upper right")
plt.tight_layout()
import os
out = r"D:\Blog\xuxu20040407.github.io\source\img\机器学习分子力场\fig_five_optimizers.png"
plt.savefig(out, facecolor=fig.get_facecolor(), dpi=130)
print("saved:", out, "size:", os.path.getsize(out))
