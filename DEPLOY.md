# GitHub 部署指南

## 📦 第一步：创建GitHub仓库

1. 访问 https://github.com/new
2. 填写仓库信息：
   - Repository name: `travel` 或 `kyoto-travel-app`
   - Description: `🏯 京都旅游App - 探索千年古都的魅力`
   - 选择 Public (公开)
   - **不要**勾选 "Initialize this repository with a README"
3. 点击 "Create repository"

## 🚀 第二步：推送代码到GitHub

复制GitHub显示的仓库URL，然后在终端执行：

```bash
cd /Users/fushuai/Documents/1test/app/travel

# 添加远程仓库（替换YOUR_USERNAME为你的GitHub用户名）
git remote add origin https://github.com/YOUR_USERNAME/travel.git

# 推送代码
git push -u origin main
```

如果出现认证问题，可能需要使用Personal Access Token：
1. 访问 https://github.com/settings/tokens
2. 点击 "Generate new token (classic)"
3. 勾选 `repo` 权限
4. 生成token并保存
5. 使用token作为密码进行推送

## 🌐 第三步：启用GitHub Pages

1. 在GitHub仓库页面，点击 "Settings" (设置)
2. 在左侧菜单找到 "Pages"
3. 在 "Source" 下选择：
   - Branch: `main`
   - Folder: `/docs`
4. 点击 "Save"
5. 等待几分钟，页面会显示网站地址：
   `https://YOUR_USERNAME.github.io/travel/`

## ✏️ 第四步：更新README链接

在README.md中更新以下链接：

1. 演示网站链接：
```markdown
[📱 查看演示网站](https://YOUR_USERNAME.github.io/travel/)
```

2. 克隆地址：
```markdown
git clone https://github.com/YOUR_USERNAME/travel.git
```

3. 作者信息和联系方式

然后提交更新：
```bash
git add README.md
git commit -m "docs: 更新README链接"
git push
```

## 🎨 第五步：更新网页中的GitHub链接

编辑 `docs/index.html`，更新两处GitHub链接：

1. 第90行：
```html
<a href="https://github.com/YOUR_USERNAME/travel" class="btn btn-secondary">查看源码</a>
```

2. 第152行：
```html
<a href="https://github.com/YOUR_USERNAME/travel" class="github-btn">
```

提交更新：
```bash
git add docs/index.html
git commit -m "docs: 更新网页GitHub链接"
git push
```

## 🎉 完成！

现在你可以：

1. 访问你的GitHub仓库： `https://github.com/YOUR_USERNAME/travel`
2. 查看宣传网页： `https://YOUR_USERNAME.github.io/travel/`
3. 分享给朋友使用！

## 📱 可选：添加应用截图

为了让README更完美，可以添加真实截图：

1. 在模拟器或真机上运行应用
2. 截取三个页面的截图
3. 在仓库中创建 `screenshots` 文件夹
4. 上传截图（命名为 locations.png, food.png, accommodation.png）
5. 提交并推送

```bash
mkdir screenshots
# 将截图复制到screenshots文件夹
git add screenshots/
git commit -m "docs: 添加应用截图"
git push
```

## 🔄 后续更新

每次修改代码后：
```bash
git add .
git commit -m "描述你的修改"
git push
```

GitHub Pages会自动更新网站内容！
