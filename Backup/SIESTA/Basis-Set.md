---
title: Basis-Set
mathjax: true
date: 2025-03-27 14:13:24
tags:
categories:
cover:
---

# Visualization of Basis Set

通过在`$HOME/.local/bin`中添加新的命令来可视化轨道的形状：

```bash
#!/bin/sh
#
string="$@"

ioncat $@  > .tmp_ioncat

cat > .plot.g << EOF
set title "$string"
plot ".tmp_ioncat" using 1:2 w l title "f"
replot ".tmp_ioncat" using 1:3 w l title "grad f"
EOF
#
gnuplot -persist .plot.g
```


