#!/bin/bash

# 进入Hexo的 source/_posts/ 目录
cd source/_posts/

# 遍历目录下的所有 .md 文件
for file in *.md
do
  
  # 提取文件名（不含扩展名）
  filename=$(basename "$file" .md)
  mv "$file" "$filename-old.md"
  
  # 使用hexo new创建新文章，这里假设布局为默认的post
  hexo new $filename
  
  # 检查新文件是否创建成功
  if [ -f "$filename.md" ]; then
    # 将旧文件内容复制到新文件中
    cat $filename-old.md > $filename.md
    
    echo "Updated $filename.md"
  else
    echo "Failed to create new post for $filename"
  fi
done

# 返回到原始目录
cd -

echo "All posts have been updated."