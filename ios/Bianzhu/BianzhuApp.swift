import SwiftUI

@main
struct BianzhuApp: App {
    var body: some Scene {
        WindowGroup { BianzhuRootView() }
    }
}

enum BianzhuTab: String, CaseIterable {
    case listen = "阅读"
    case search = "搜索"
    case saved = "书签"

    var symbol: String {
        switch self {
        case .listen: "book.closed"
        case .search: "magnifyingglass"
        case .saved: "bookmark"
        }
    }
}

struct BianzhuRootView: View {
    @StateObject private var music = MusicService()
    @AppStorage("bianzhu.saved.v1") private var savedRaw = ""
    @State private var tab: BianzhuTab = .listen
    @State private var selectedStory: Story?
    @State private var query = ""
    @State private var searchTask: Task<Void, Never>?

    private var savedIDs: Set<String> {
        Set(savedRaw.split(separator: ",").map(String.init))
    }
    private var savedStories: [Story] {
        StoryLibrary.all.filter { savedIDs.contains($0.id) }
    }

    var body: some View {
        ZStack {
            Palette.paper.ignoresSafeArea()
            Group {
                switch tab {
                case .listen: listenPage
                case .search: searchPage
                case .saved: savedPage
                }
            }
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            VStack(spacing: 0) {
                if let song = music.currentSong {
                    MiniPlayer(song: song, isPlaying: music.isPlaying) {
                        Task { await music.togglePlayback() }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
                }
                tabBar
            }
            .background(.ultraThinMaterial)
        }
        .sheet(item: $selectedStory) { story in
            StoryDetailSheet(story: story, music: music, isSaved: savedIDs.contains(story.id)) {
                toggleSaved(story)
            }
            .presentationDragIndicator(.visible)
            .presentationCornerRadius(26)
        }
        .alert("边注", isPresented: Binding(get: { music.message != nil }, set: { if !$0 { music.clearMessage() } })) {
            Button("好", role: .cancel) { music.clearMessage() }
        } message: {
            Text(music.message ?? "")
        }
        .tint(Palette.pine)
    }

    private var listenPage: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                topBar
                VStack(alignment: .leading, spacing: 7) {
                    Text(Date.now.formatted(.dateTime.month(.wide).day()).uppercased())
                        .font(.system(size: 10, weight: .semibold, design: .rounded))
                        .tracking(2.3).foregroundStyle(Palette.secondary)
                    Text("边听，边读。")
                        .font(.system(size: 33, weight: .regular, design: .serif))
                        .tracking(-1.1).foregroundStyle(Palette.ink)
                    Text("每首歌，都有一段未讲完的故事。")
                        .font(.system(size: 14)).foregroundStyle(Palette.secondary)
                }
                .padding(.top, 24).padding(.bottom, 23)

                if let featured = StoryLibrary.all.first {
                    Button { selectedStory = featured } label: {
                        FeaturedStoryCard(story: featured) {
                            Task { await music.play(story: featured) }
                        }
                    }
                    .buttonStyle(.plain)
                }

                HStack(alignment: .firstTextBaseline) {
                    Text("今晚，慢慢听")
                        .font(.system(size: 21, weight: .regular, design: .serif)).foregroundStyle(Palette.ink)
                    Spacer()
                    Text("\(StoryLibrary.all.count) 则故事")
                        .font(.system(size: 12)).foregroundStyle(Palette.secondary)
                }
                .padding(.top, 29).padding(.bottom, 9)

                ForEach(Array(StoryLibrary.all.dropFirst())) { story in
                    StoryRow(story: story, isSaved: savedIDs.contains(story.id), onOpen: { selectedStory = story }, onPlay: {
                        Task { await music.play(story: story) }
                    }, onSave: { toggleSaved(story) })
                }

                appleMusicFooter
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 22)
        }
    }

    private var searchPage: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                topBar
                VStack(alignment: .leading, spacing: 6) {
                    Text("在 Apple Music 里找歌。")
                        .font(.system(size: 29, weight: .regular, design: .serif)).foregroundStyle(Palette.ink)
                    Text("找到歌曲，再沿着故事听下去。")
                        .font(.system(size: 14)).foregroundStyle(Palette.secondary)
                }
                HStack(spacing: 10) {
                    Image(systemName: "magnifyingglass").foregroundStyle(Palette.secondary)
                    TextField("歌曲、歌手或专辑", text: $query)
                        .submitLabel(.search)
                        .onSubmit { Task { await music.search(query) } }
                        .onChange(of: query) { _, value in
                            searchTask?.cancel()
                            guard !value.trimmingCharacters(in: .whitespaces).isEmpty else { music.clearSearchResults(); return }
                            guard music.isAuthorized else { return }
                            searchTask = Task {
                                try? await Task.sleep(for: .milliseconds(350))
                                if !Task.isCancelled { await music.search(value) }
                            }
                        }
                    if !query.isEmpty {
                        Button { query = ""; music.searchResults = [] } label: { Image(systemName: "xmark.circle.fill").foregroundStyle(Palette.secondary) }
                    }
                }
                .padding(14).background(Palette.surface).clipShape(RoundedRectangle(cornerRadius: 13))

                if !music.isAuthorized {
                    AppleMusicConnectCard {
                        Task { await music.requestAuthorization() }
                    }
                } else if music.isLoading {
                    ProgressView("正在搜索 Apple Music…").tint(Palette.pine).padding(.top, 14)
                } else if !music.searchResults.isEmpty {
                    VStack(spacing: 0) {
                        ForEach(music.searchResults, id: \.id) { song in
                            CatalogSongRow(song: song, isPlaying: music.currentSong?.id == song.id && music.isPlaying) {
                                Task { await music.play(song) }
                            }
                        }
                    }
                } else if !query.isEmpty {
                    Text("没有找到结果，试试换一种写法。")
                        .font(.system(size: 14)).foregroundStyle(Palette.secondary).padding(.top, 8)
                } else {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("从故事开始")
                            .font(.system(size: 17, weight: .regular, design: .serif)).foregroundStyle(Palette.ink)
                        ForEach(StoryLibrary.all.prefix(3)) { story in
                            Button {
                                query = story.searchTerm
                                Task { await music.search(story.searchTerm) }
                            } label: {
                                HStack {
                                    Text(story.title).foregroundStyle(Palette.ink)
                                    Spacer()
                                    Text(story.artist).foregroundStyle(Palette.secondary)
                                    Image(systemName: "arrow.up.left").font(.system(size: 11)).foregroundStyle(Palette.secondary)
                                }.font(.system(size: 13)).padding(.vertical, 11)
                            }.buttonStyle(.plain)
                            Divider().overlay(Palette.rule)
                        }
                    }.padding(.top, 6)
                }
                appleMusicFooter
            }
            .padding(.horizontal, 20).padding(.bottom, 26)
        }
    }

    private var savedPage: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                topBar
                Text("留下的故事")
                    .font(.system(size: 30, weight: .regular, design: .serif)).foregroundStyle(Palette.ink)
                    .padding(.top, 25)
                Text("喜欢的歌与故事，都在这里。")
                    .font(.system(size: 14)).foregroundStyle(Palette.secondary).padding(.top, 5).padding(.bottom, 20)
                if savedStories.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        Image(systemName: "bookmark").font(.system(size: 21)).foregroundStyle(Palette.pine)
                        Text("还没有书签").font(.system(size: 18, design: .serif)).foregroundStyle(Palette.ink)
                        Text("读到想再看的一篇，就把它留下。")
                            .font(.system(size: 13)).foregroundStyle(Palette.secondary)
                        Button("去发现故事") { tab = .listen }
                            .font(.system(size: 13, weight: .semibold)).foregroundStyle(Palette.pine).padding(.top, 6)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading).padding(22)
                    .background(Palette.surface).clipShape(RoundedRectangle(cornerRadius: 16))
                } else {
                    ForEach(savedStories) { story in
                        StoryRow(story: story, isSaved: true, onOpen: { selectedStory = story }, onPlay: {
                            Task { await music.play(story: story) }
                        }, onSave: { toggleSaved(story) })
                    }
                }
                appleMusicFooter
            }
            .padding(.horizontal, 20).padding(.bottom, 24)
        }
    }

    private var topBar: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 3) {
                Text("边注").font(.system(size: 24, weight: .medium, design: .serif)).tracking(4).foregroundStyle(Palette.pine)
                Text("MUSIC, WITH MARGINALIA").font(.system(size: 8, weight: .medium, design: .rounded)).tracking(1.6).foregroundStyle(Palette.secondary)
            }
            Spacer()
            Button {
                tab = .search
                if !music.isAuthorized { Task { await music.requestAuthorization() } }
            } label: {
                HStack(spacing: 6) {
                    Image(systemName: music.isAuthorized ? "checkmark" : "apple.logo")
                    Text(music.isAuthorized ? "已连接" : "Apple Music")
                }
                .font(.system(size: 11, weight: .medium)).foregroundStyle(Palette.ink)
                .padding(.horizontal, 11).padding(.vertical, 9)
                .background(Palette.surface.opacity(0.88)).clipShape(Capsule())
                .overlay(Capsule().stroke(Palette.rule, lineWidth: 0.7))
            }.buttonStyle(.plain)
        }
        .padding(.top, 7)
    }

    private var tabBar: some View {
        HStack(spacing: 0) {
            ForEach(BianzhuTab.allCases, id: \.self) { item in
                Button { withAnimation(.easeInOut(duration: 0.2)) { tab = item } } label: {
                    VStack(spacing: 4) {
                        Image(systemName: item.symbol).font(.system(size: 17, weight: tab == item ? .medium : .regular))
                        Text(item.rawValue).font(.system(size: 10, weight: tab == item ? .semibold : .regular))
                    }
                    .foregroundStyle(tab == item ? Palette.pine : Palette.secondary)
                    .frame(maxWidth: .infinity).frame(height: 47)
                    .contentShape(Rectangle())
                }.buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 18).padding(.top, 4)
    }

    private var appleMusicFooter: some View {
        HStack(spacing: 7) {
            Image(systemName: "apple.logo").font(.system(size: 11))
            Text("歌曲搜索与播放由 Apple Music 提供")
                .font(.system(size: 10)).tracking(0.2)
        }
        .foregroundStyle(Palette.secondary.opacity(0.8))
        .frame(maxWidth: .infinity).padding(.top, 25)
    }

    private func toggleSaved(_ story: Story) {
        var ids = savedIDs
        if ids.contains(story.id) { ids.remove(story.id) }
        else { ids.insert(story.id) }
        savedRaw = StoryLibrary.all.map(\.id).filter(ids.contains).joined(separator: ",")
    }
}

private enum Palette {
    static let paper = Color(red: 0.91, green: 0.88, blue: 0.82)
    static let surface = Color(red: 0.97, green: 0.95, blue: 0.91)
    static let ink = Color(red: 0.12, green: 0.11, blue: 0.10)
    static let secondary = Color(red: 0.39, green: 0.36, blue: 0.32)
    static let pine = Color(red: 0.12, green: 0.23, blue: 0.20)
    static let rule = Color(red: 0.76, green: 0.72, blue: 0.66)
}
