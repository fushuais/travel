# 🏯 京都旅游 App

> 探索千年古都的魅力 - 一款精美的iOS旅游应用

[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/platform-iOS%2018.0%2B-lightgrey.svg)](https://developer.apple.com)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

[📱 查看演示网站](https://yourusername.github.io/travel/)

## ✨ 功能特点

### 📍 精选位置
探索京都最著名的景点，包括：
- 🏯 清水寺 - 世界文化遗产
- ⛩️ 伏见稻荷大社 - 千本鸟居
- 🏛️ 金阁寺 - 金光闪闪的禅寺
- 🎋 岚山竹林 - 如诗如画的小径
- 🎎 祇园 - 传统艺伎区
- 🏰 二条城 - 德川家康的城堡

每个景点都配有高质量的真实照片和详细介绍。

### 🍜 地道美食
品尝最正宗的京都美食：
- 🍱 怀石料理 - 精致的传统多道料理
- 🍜 京都拉面 - 浓郁的猪骨汤底
- 🍵 抹茶甜点 - 宇治抹茶制作
- 🥘 豆腐料理 - 清泉制作的嫩滑豆腐
- 🍚 鳗鱼饭 - 炭火烤制
- 🍣 京都寿司 - 新鲜海鲜

包含价格参考，让你轻松规划美食之旅。

### 🏠 舒适住宿
精选各类住宿选择：
- 传统町屋民宿
- 温泉旅馆
- 精品酒店
- 禅意民宿
- 五星度假村
- 青年旅社

提供详细的价格、评分和特色介绍。

## 📱 技术栈

- **语言**: Swift 5.0
- **框架**: SwiftUI
- **最低版本**: iOS 18.0
- **架构**: MVVM
- **特性**:
  - 异步图片加载
  - 现代化UI设计
  - 响应式布局
  - 底部Tab导航

## 🚀 快速开始

### 环境要求

- macOS 14.0+
- Xcode 16.3+
- iOS 18.0+

### 安装步骤

1. 克隆仓库
```bash
git clone https://github.com/yourusername/travel.git
cd travel
```

2. 打开项目
```bash
open travel.xcodeproj
```

3. 选择模拟器或真机，点击运行按钮 (⌘R)

## 📸 截图

<div align="center">
  <img src="screenshots/locations.png" width="250" alt="位置页面">
  <img src="screenshots/food.png" width="250" alt="美食页面">
  <img src="screenshots/accommodation.png" width="250" alt="住宿页面">
</div>

## 🎨 设计特色

- **现代化UI**: 采用卡片式设计，美观大方
- **流畅动画**: 丰富的交互动画和过渡效果
- **响应式**: 完美支持iPhone和iPad
- **主题色**: 橙色主题，代表日本传统色彩

## 📂 项目结构

```
travel/
├── travel/
│   ├── travelApp.swift          # 应用入口
│   ├── ContentView.swift        # 主视图(TabView)
│   ├── LocationView.swift       # 位置页面
│   ├── FoodView.swift           # 美食页面
│   ├── AccommodationView.swift  # 住宿页面
│   └── Assets.xcassets/         # 资源文件
├── travelTests/                 # 单元测试
├── travelUITests/               # UI测试
└── docs/                        # 宣传网页
    └── index.html
```

## 🔧 配置说明

### 网络权限

项目已配置`NSAppTransportSecurity`以支持网络图片加载：

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 📝 开发计划

- [ ] 添加地图集成
- [ ] 实现离线收藏功能
- [ ] 添加多语言支持 (English, 日本語)
- [ ] 集成天气信息
- [ ] 添加行程规划功能
- [ ] 用户评论和评分系统

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情

## 👨‍💻 作者

- **Your Name** - [GitHub](https://github.com/yourusername)

## 🙏 致谢

- 图片来源: [Unsplash](https://unsplash.com)
- 设计灵感: Apple Design Resources
- Icons: SF Symbols

## 📧 联系方式

如有问题或建议，请通过以下方式联系：

- 📧 Email: your.email@example.com
- 🐦 Twitter: @yourusername
- 💼 LinkedIn: your-profile

---

<div align="center">
  <p>Made with ❤️ for travelers</p>
  <p>© 2026 京都旅游 App. All rights reserved.</p>
</div>
