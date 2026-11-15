# 边注

边听边读的音乐故事 App。一首歌一张卡片，正文是这首歌写成时的笔记。仓库保留静态网页预览，同时新增 SwiftUI 原生 iOS 工程；原生版本使用 MusicKit 请求 Apple Music 授权、搜索歌曲并在 App 内播放。

静态网页预览不用构建，可直接打开 `index.html` 或在目录内启动本地服务器。原生 iOS 工程位于 `ios/Bianzhu.xcodeproj`，运行步骤见 `ios/README.md`。

## 页面

- **阅读** 晚间一套故事卡。左右滑，或用上一则 / 下一则。圆钮演示播放和暂停；“在 Apple Music 打开”会按歌曲和歌手搜索。留下这篇会收进书签。阅读全文进入正文。
- **正在听** 完整笔记，播放条固定在下面。返回回到来的那一页。
- **书签** 留下的故事，最近的在前。可以打开，也可以移出。
- **目录** 七则按晚上的顺序排好，点一则回到那张卡。

## 给接着改的人

网页预览的歌曲、笔记和版式在 `js/app.js` 与 `css/app.css`。原生 App 的 MusicKit 搜索、用户授权和播放逻辑在 `ios/Bianzhu/MusicService.swift`；需要在 Apple Developer 网站为 App ID 开启 MusicKit App Service，并用 Xcode 签名后在 iPhone 上运行。
