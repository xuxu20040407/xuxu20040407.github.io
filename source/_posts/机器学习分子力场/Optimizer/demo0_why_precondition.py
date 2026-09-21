import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rcParams

# 病态损失: f = 1/2 (lambda1 x^2 + lambda2 y^2),  lambda1 >> lambda2  =>  竖向峡谷
lambda1, lambda2 = 40.0, 1.0
def loss(x, y): return 0.5 * (lambda1*x**2 + lambda2*y**2)
def grad(x, y): return np.array([lambda1*x, lambda2*y])

def sgd(g, st):                           # 一阶：裸梯度
    return -st["lr"] * g
def momentum(g, st):                      # 一阶 + 惯性
    st["m"] = st["mu"]*st["m"] + g; return -st["lr"] * st["m"]
def adam(g, st):                          # 对角自适应
    st["t"] += 1; st["m"] = 0.9*st["m"] + 0.1*g; st["v"] = 0.999*st["v"] + 0.001*g*g
    mh = st["m"]/(1-0.9**st["t"]); vh = st["v"]/(1-0.999**st["t"])
    return -st["lr"] * mh/(np.sqrt(vh)+1e-8)
def preconditioned(g, st):               # 对角预条件
    st["v"] = st["b2"]*st["v"] + (1-st["b2"])*g*g; return -st["lr"] * g/(np.sqrt(st["v"])+1e-8)

start = np.array([-2.8, 2.6])
runs = {"SGD":            (sgd,            {"lr": 0.045}),
        "SGD+momentum":   (momentum,       {"lr": 0.02, "mu": 0.9, "m": np.zeros(2)}),
        "Adam":           (adam,           {"lr": 0.25, "m": np.zeros(2), "v": np.zeros(2), "t": 0}),
        "Preconditioned": (preconditioned, {"lr": 0.25, "v": np.ones(2), "b2": 0.999, "warmup": 10})}

def train(fn, st, n=120):
    w = start.copy(); ws = [w.copy()]
    for _ in range(st.get("warmup", 0)):
        g = grad(*w); fn(g, st)
    for _ in range(n):
        g = grad(*w); w = w + fn(g, st); ws.append(w.copy())
    return np.array(ws)

paths = {name: train(fn, st) for name, (fn, st) in runs.items()}

rcParams.update({"figure.facecolor":"#1e1e2e","axes.facecolor":"#1e1e2e",
    "text.color":"white","axes.edgecolor":"#555577","axes.labelcolor":"white"})
fig, ax = plt.subplots(figsize=(9,7.5), dpi=130)
xx=np.linspace(-3.5,3.5,300); yy=np.linspace(-3.5,3.5,300)
X,Y=np.meshgrid(xx,yy); Z=loss(X,Y)
ax.contour(X,Y,Z,levels=np.logspace(-1,2.5,30),colors="#444466",linewidths=0.7,alpha=0.8)
styles=[("SGD","gray","--",1.6),("SGD+momentum","#4a90d9","-",2.0),
        ("Adam","#e8913a","-",2.0),("Preconditioned","#4cd964","-",2.3)]
for(name,color,ls,lw) in styles:
    p=paths[name]; ax.plot(p[:,0],p[:,1],color=color,linestyle=ls,linewidth=lw,zorder=3)
    ax.scatter([p[-1,0]],[p[-1,1]],color=color,s=28,zorder=4)
ax.scatter([start[0]],[start[1]],marker="o",color="#e6c84d",s=110,zorder=5)
ax.text(start[0]+0.15,start[1]+0.15,"start",color="#e6c84d",fontsize=12,fontweight="bold")
ax.scatter([0],[0],marker="*",color="white",s=260,zorder=5)
ax.text(0.15,-0.45,"minimum",color="white",fontsize=11)
ax.set_title("Why precondition?",fontsize=20,fontweight="bold",pad=14)
ax.set_xlabel("steep direction",fontsize=10,color="#aaaaaa")
ax.set_ylabel(r"valley direction  (ill-conditioned,  $\kappa=40$)",fontsize=10,color="#aaaaaa")
ax.set_xlim(-3.5,3.5);ax.set_ylim(-3.5,3.5);ax.set_aspect("equal");ax.grid(False)
handles=[plt.Line2D([0],[0],color=c,linestyle=l,linewidth=2,label=n)for(n,c,l,lw)in styles]
ax.legend(handles=handles,loc="lower right",fontsize=10,facecolor="#2a2a3e",edgecolor="#555577",labelcolor="white")
plt.tight_layout()
plt.savefig(r"D:\Blog\xuxu20040407.github.io\source\img\机器学习分子力场\fig_why_precondition.png",facecolor=fig.get_facecolor(),dpi=130)
print("done")
