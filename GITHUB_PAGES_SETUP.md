# GitHub Pages 配置指南

## 问题
如果 GitHub Pages 显示默认的 Jekyll 介绍页面，而不是自定义的 index.html，请按以下步骤配置。

## 解决方案

### 方法 1：使用 GitHub Actions（推荐）

✅ 已添加：`.github/workflows/static.yml`

此工作流会：
- 自动从 `docs/` 文件夹部署静态内容
- 绕过 Jekyll 处理
- 每次推送到 `main` 分支时自动部署

### 方法 2：手动配置 GitHub Pages

1. 进入 GitHub 仓库：https://github.com/fushuais/travel/settings/pages
2. 在 "Build and deployment" 部分：
   - **Source**: 选择 `Deploy from a branch`
   - **Branch**: 选择 `main` 分支
   - **Folder**: 选择 `/ (root)` 或 `/docs`
3. 点击 **Save**

### 方法 3：使用 GitHub CLI

```bash
gh api repos/:owner/:repo/pages -X PUT -f source[branch]=main -f source[path]=/docs
```

## 验证配置

配置完成后，访问以下 URL 检查：

- **主页面**: https://fushuais.github.io/travel/
- **测试页面**: https://fushuais.github.io/travel/test.html
- **GitHub Actions**: https://github.com/fushuais/travel/actions

## 故障排查

### 如果仍然显示 Jekyll 默认页面

1. **清除缓存**
   - 打开浏览器开发者工具 (F12)
   - 右键点击刷新按钮
   - 选择"清空缓存并硬性重新加载"

2. **检查文件**
   ```bash
   ls -la docs/
   # 应该看到：
   # -rw-r--r--  .nojekyll
   # -rw-r--r--  index.html
   ```

3. **查看 Actions 日志**
   - 访问：https://github.com/fushuais/travel/actions
   - 查看最新的部署工作流
   - 检查是否有错误

4. **等待部署**
   - GitHub Pages 通常需要 1-3 分钟
   - 如果刚推送了更改，请耐心等待

## 文件结构

```
travel/
├── .github/
│   └── workflows/
│       └── static.yml          # 部署工作流
├── docs/
│   ├── .nojekyll             # 禁用 Jekyll
│   ├── index.html            # 主页面
│   └── test.html             # 诊断页面
└── travel/                  # iOS 应用源码
```

## 需要帮助？

如果问题仍然存在，请提供：
1. 浏览器控制台的错误信息 (F12 → Console)
2. GitHub Actions 的部署日志
3. 访问 https://fushuais.github.io/travel/ 时的截图
