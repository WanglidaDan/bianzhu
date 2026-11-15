import Foundation
import MusicKit
import Combine

@MainActor
final class MusicService: ObservableObject {
    @Published private(set) var authorization = MusicAuthorization.currentStatus
    @Published private(set) var searchResults: [Song] = []
    @Published private(set) var isPlaying = false
    @Published private(set) var currentSong: Song?
    @Published private(set) var message: String?
    @Published private(set) var isLoading = false

    private let player = ApplicationMusicPlayer.shared

    var isAuthorized: Bool { authorization == .authorized }

    func requestAuthorization() async {
        authorization = await MusicAuthorization.request()
        if authorization != .authorized {
            message = "需要允许边注访问 Apple Music，才能搜索并播放歌曲。你也可以在 iPhone 设置中更改权限。"
        } else {
            message = "Apple Music 已连接。搜索歌曲后即可在边注中播放。"
        }
    }

    func search(_ term: String) async {
        guard isAuthorized else {
            message = "请先连接 Apple Music。"
            return
        }
        let cleaned = term.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !cleaned.isEmpty else { searchResults = []; return }
        isLoading = true
        defer { isLoading = false }
        do {
            var request = MusicCatalogSearchRequest(term: cleaned, types: [Song.self])
            request.limit = 12
            let response = try await request.response()
            searchResults = Array(response.songs)
            if searchResults.isEmpty { message = "Apple Music 暂时没有找到这首歌。" }
        } catch {
            message = "暂时无法搜索 Apple Music。请检查网络或稍后再试。"
        }
    }

    func play(_ song: Song) async {
        guard isAuthorized else {
            await requestAuthorization()
            guard isAuthorized else { return }
        }
        do {
            player.queue = [song]
            try await player.play()
            currentSong = song
            isPlaying = true
            message = nil
        } catch {
            isPlaying = false
            message = "这首歌暂时无法播放。请确认 Apple Music 订阅状态和网络连接。"
        }
    }

    func pause() async {
        player.pause()
        isPlaying = false
    }

    func clearMessage() { message = nil }
    func clearSearchResults() { searchResults = [] }

    func togglePlayback() async {
        if isPlaying { await pause() }
        else if let currentSong { await play(currentSong) }
    }

    func play(story: Story) async {
        guard isAuthorized else {
            await requestAuthorization()
            guard isAuthorized else { return }
        }
        await search(story.searchTerm)
        guard let match = bestMatch(for: story) else {
            message = "Apple Music 曲库中没有找到匹配版本。你可以在搜索页手动选择歌曲。"
            return
        }
        await play(match)
    }

    private func bestMatch(for story: Story) -> Song? {
        let title = story.title.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
        let artist = story.artist.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
        return searchResults.first(where: {
            $0.title.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current).contains(title)
            && $0.artistName.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current).contains(artist)
        }) ?? searchResults.first(where: {
            $0.title.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current).contains(title)
        })
    }
}
