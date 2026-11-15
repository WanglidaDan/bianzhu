# 边注 iOS

SwiftUI 原生 iPhone/iPad App，最低 iOS 17。界面承接网页原型的暖纸色、衬线标题、抽象唱片封面与留白排版。歌曲搜索、授权与播放通过 Apple Music 的 MusicKit 完成。

## 在 Xcode 中运行

1. 用 macOS 上的 Xcode 打开 `Bianzhu.xcodeproj`。
2. 在 Signing & Capabilities 选择自己的 Apple Developer Team，并将 `work.lidawang.bianzhu` 改成账户下唯一的 Bundle Identifier。
3. 在 Apple Developer 网站的 Identifiers 中，为该 App ID 打开 **MusicKit** App Service。
4. 连接一台 iPhone，选择该设备并运行。MusicKit 授权和 Apple Music 曲库播放需在真实设备及满足 Apple Music 订阅/曲库权限条件的账户上验证。
5. 首次点按顶部 Apple Music 按钮时，系统会显示音乐访问授权提示。允许后可搜索曲库并在边注内播放。

MusicKit 会管理 Apple 平台上的开发者令牌和用户令牌；本工程不包含私钥或令牌。歌曲故事是本地内容，Apple Music 负责授权曲库搜索与音乐播放。
