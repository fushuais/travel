#!/bin/bash

# 京都旅游App - GitHub部署脚本
# 使用方法: ./deploy.sh YOUR_GITHUB_USERNAME

# 检查是否提供了GitHub用户名
if [ -z "$1" ]; then
    echo "❌ 请提供你的GitHub用户名"
    echo "使用方法: ./deploy.sh YOUR_GITHUB_USERNAME"
    exit 1
fi

USERNAME=$1
REPO_NAME="travel"

echo "🚀 开始部署到GitHub..."
echo "📦 用户名: $USERNAME"
echo "📦 仓库名: $REPO_NAME"
echo ""

# 检查是否已有远程仓库
if git remote | grep -q "origin"; then
    echo "⚠️  检测到已存在的远程仓库"
    echo "当前远程仓库:"
    git remote -v
    read -p "是否要更新远程仓库地址? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git remote remove origin
        git remote add origin "https://github.com/$USERNAME/$REPO_NAME.git"
        echo "✅ 已更新远程仓库地址"
    fi
else
    # 添加远程仓库
    echo "📡 添加远程仓库..."
    git remote add origin "https://github.com/$USERNAME/$REPO_NAME.git"
    echo "✅ 远程仓库添加成功"
fi

echo ""

# 检查是否有未提交的更改
if [[ -n $(git status -s) ]]; then
    echo "📝 检测到未提交的更改"
    git status -s
    read -p "是否提交这些更改? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git add .
        read -p "请输入提交信息: " commit_message
        git commit -m "$commit_message"
        echo "✅ 更改已提交"
    fi
fi

echo ""

# 推送到GitHub
echo "⬆️  推送代码到GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 部署成功！"
    echo ""
    echo "📍 下一步操作："
    echo "1. 访问你的仓库: https://github.com/$USERNAME/$REPO_NAME"
    echo "2. 点击 Settings → Pages"
    echo "3. 在 Source 下选择:"
    echo "   - Branch: main"
    echo "   - Folder: /docs"
    echo "4. 点击 Save"
    echo ""
    echo "🌐 几分钟后，你的网站将发布到:"
    echo "   https://$USERNAME.github.io/$REPO_NAME/"
    echo ""
    echo "📖 查看完整部署指南: cat DEPLOY.md"
else
    echo ""
    echo "❌ 推送失败"
    echo "可能的原因:"
    echo "1. 仓库不存在 - 请先在GitHub创建仓库: https://github.com/new"
    echo "2. 认证失败 - 可能需要使用Personal Access Token"
    echo "   访问: https://github.com/settings/tokens"
    echo ""
    echo "📖 查看详细帮助: cat DEPLOY.md"
fi
