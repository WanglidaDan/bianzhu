import SwiftUI
import MusicKit

private extension View {
    func paperCard() -> some View {
        background(Palette.surface).clipShape(RoundedRectangle(cornerRadius: 17, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 17, style: .continuous).stroke(Palette.rule.opacity(0.48), lineWidth: 0.7))
    }
}

struct FeaturedStoryCard: View {
    let story: Story
    let onOpen: () -> Void
    let onPlay: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: onOpen) {
                ZStack(alignment: .bottomLeading) {
                    StoryArtwork(story: story)
                    LinearGradient(colors: [.clear, .black.opacity(0.58)], startPoint: .center, endPoint: .bottom)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("TONIGHT’S STORY  ·  01")
                            .font(.system(size: 9, weight: .semibold, design: .rounded)).tracking(2)
                            .foregroundStyle(.white.opacity(0.82))
                        Text(story.title)
                            .font(.system(size: 27, weight: .regular, design: .serif)).tracking(-0.5)
                            .foregroundStyle(.white)
                        Text("\(story.artist)  ·  \(story.year)")
                            .font(.system(size: 12)).foregroundStyle(.white.opacity(0.82))
                    }
                    .padding(18)
                }
                .frame(height: 238).clipped()
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 14) {
                Text(story.dek)
                    .font(.system(size: 17, weight: .regular, design: .serif)).foregroundStyle(Palette.ink)
                Text(story.paragraphs[0])
                    .font(.system(size: 13)).lineSpacing(5).foregroundStyle(Palette.secondary)
                    .lineLimit(3).multilineTextAlignment(.leading)
                HStack {
                    Button(action: onPlay) {
                        HStack(spacing: 8) {
                            Image(systemName: "apple.logo").font(.system(size: 13))
                            Text("Apple Music 播放").font(.system(size: 12, weight: .semibold))
                            Image(systemName: "arrow.up.right").font(.system(size: 9, weight: .semibold))
                        }
                        .foregroundStyle(Palette.surface).padding(.horizontal, 15).frame(height: 40)
                        .background(Palette.pine, in: Capsule())
                    }.buttonStyle(.plain)
                    Spacer()
                    Button(action: onOpen) {
                        HStack(spacing: 5) {
                            Text("读这首歌").font(.system(size: 12, weight: .medium))
                            Image(systemName: "arrow.right").font(.system(size: 10))
                        }.foregroundStyle(Palette.pine)
                    }.buttonStyle(.plain)
                }
            }
            .padding(17)
        }
        .background(Palette.surface)
        .clipShape(RoundedRectangle(cornerRadius: 19, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 19, style: .continuous).stroke(Palette.rule.opacity(0.55), lineWidth: 0.7))
        .shadow(color: Palette.ink.opacity(0.08), radius: 18, x: 0, y: 10)
    }
}

struct StoryRow: View {
    let story: Story
    let isSaved: Bool
    let onOpen: () -> Void
    let onPlay: () -> Void
    let onSave: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            Button(action: onOpen) {
                StoryArtwork(story: story).frame(width: 58, height: 58).clipShape(RoundedRectangle(cornerRadius: 7))
            }.buttonStyle(.plain)
            Button(action: onOpen) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(story.title).font(.system(size: 15, weight: .medium, design: .serif)).foregroundStyle(Palette.ink).lineLimit(1)
                    Text("\(story.artist)  ·  \(story.year)").font(.system(size: 11)).foregroundStyle(Palette.secondary).lineLimit(1)
                    Text(story.dek).font(.system(size: 11)).foregroundStyle(Palette.secondary.opacity(0.9)).lineLimit(1)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }.buttonStyle(.plain)
            Button(action: onSave) {
                Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                    .font(.system(size: 13)).foregroundStyle(isSaved ? Palette.pine : Palette.secondary)
                    .frame(width: 32, height: 40)
            }.buttonStyle(.plain).accessibilityLabel(isSaved ? "移除书签" : "添加书签")
            Button(action: onPlay) {
                Image(systemName: "play.fill").font(.system(size: 12)).foregroundStyle(Palette.pine)
                    .frame(width: 37, height: 37)
                    .background(Palette.paper, in: Circle())
                    .overlay(Circle().stroke(Palette.rule.opacity(0.55), lineWidth: 0.6))
            }.buttonStyle(.plain).accessibilityLabel("在 Apple Music 播放《\(story.title)》")
        }
        .padding(.vertical, 11)
        .overlay(alignment: .bottom) { Rectangle().fill(Palette.rule.opacity(0.65)).frame(height: 0.6) }
    }
}

struct StoryArtwork: View {
    let story: Story

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            ZStack {
                background
                switch story.id {
                case "pink-moon":
                    Circle().stroke(Color(red: 0.88, green: 0.84, blue: 0.74).opacity(0.32), lineWidth: 1)
                        .frame(width: size.height * 0.9).offset(x: size.width * 0.18, y: -size.height * 0.18)
                    Circle().fill(Color(red: 0.91, green: 0.86, blue: 0.75))
                        .frame(width: size.height * 0.55).offset(x: size.width * 0.18, y: -size.height * 0.18)
                    Rectangle().fill(.black.opacity(0.18)).frame(height: size.height * 0.27).offset(y: size.height * 0.38)
                case "landslide":
                    MountainBand(points: [0.62,0.3,0.44,0.22,0.61,0.35,0.48,0.18,0.55,0.4,0.67]).fill(Color(red: 0.48, green: 0.36, blue: 0.29))
                    MountainBand(points: [0.75,0.53,0.64,0.45,0.73,0.48,0.6,0.42,0.76,0.5,0.68]).fill(Color(red: 0.72, green: 0.62, blue: 0.52))
                    Rectangle().fill(Color.white.opacity(0.3)).frame(height: size.height * 0.2).offset(y: size.height * 0.42)
                case "by-your-side":
                    Ellipse().fill(Color(red: 0.75, green: 0.57, blue: 0.37).opacity(0.6)).frame(width: size.width * 0.7, height: size.height * 0.09).blur(radius: 18).offset(y: size.height * 0.17)
                    Rectangle().fill(Color(red: 0.77, green: 0.65, blue: 0.45)).frame(height: 1).padding(.horizontal, size.width * 0.08).offset(y: size.height * 0.15)
                case "hill":
                    HillLines().stroke(Color(red: 0.13, green: 0.28, blue: 0.22).opacity(0.72), lineWidth: 1).padding(.horizontal, -10)
                case "holocene":
                    Rectangle().fill(Color(red: 0.76, green: 0.79, blue: 0.75)).frame(height: size.height * 0.35).offset(y: size.height * 0.33)
                    Rectangle().fill(Color(red: 0.45, green: 0.52, blue: 0.47)).frame(height: 1).offset(y: size.height * 0.15)
                    Circle().fill(Color(red: 0.65, green: 0.29, blue: 0.21)).frame(width: 8, height: 8).offset(x: -size.width * 0.28, y: size.height * 0.13)
                case "cranes":
                    Crane(height: size.height * 0.74, width: size.width * 0.18).offset(x: -size.width * 0.27, y: size.height * 0.1)
                    Crane(height: size.height * 0.9, width: size.width * 0.2).offset(x: size.width * 0.03, y: size.height * 0.05)
                    Crane(height: size.height * 0.63, width: size.width * 0.13).offset(x: size.width * 0.31, y: size.height * 0.12)
                default:
                    Circle().fill(Color(red: 0.85, green: 0.72, blue: 0.61)).frame(width: size.height * 0.18)
                        .offset(x: -size.width * 0.25, y: size.height * 0.18)
                    Rectangle().fill(Color.white.opacity(0.07)).frame(height: 1).offset(y: size.height * 0.3)
                }
                LinearGradient(colors: [.white.opacity(0.07), .clear, .black.opacity(0.18)], startPoint: .topLeading, endPoint: .bottomTrailing)
            }
            .frame(width: size.width, height: size.height)
            .clipped()
        }
        .accessibilityHidden(true)
    }

    @ViewBuilder private var background: some View {
        switch story.id {
        case "pink-moon": LinearGradient(colors: [Color(red:0.16,green:0.2,blue:0.24), Color(red:0.23,green:0.28,blue:0.3), Color(red:0.12,green:0.15,blue:0.18)], startPoint: .topLeading, endPoint: .bottomTrailing)
        case "landslide": LinearGradient(colors: [Color(red:0.84,green:0.78,blue:0.7), Color(red:0.65,green:0.53,blue:0.44)], startPoint: .top, endPoint: .bottom)
        case "by-your-side": LinearGradient(colors: [Color(red:0.16,green:0.14,blue:0.13), Color(red:0.34,green:0.25,blue:0.19), Color(red:0.12,green:0.11,blue:0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)
        case "hill": LinearGradient(colors: [Color(red:0.8,green:0.85,blue:0.8), Color(red:0.67,green:0.76,blue:0.7)], startPoint: .top, endPoint: .bottom)
        case "holocene": LinearGradient(colors: [Color(red:0.84,green:0.86,blue:0.83), Color(red:0.7,green:0.76,blue:0.72)], startPoint: .top, endPoint: .bottom)
        case "cranes": LinearGradient(colors: [Color(red:0.69,green:0.77,blue:0.79), Color(red:0.82,green:0.82,blue:0.74)], startPoint: .topLeading, endPoint: .bottomTrailing)
        default: LinearGradient(colors: [Color(red:0.11,green:0.1,blue:0.14), Color(red:0.28,green:0.23,blue:0.25)], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
}

private struct MountainBand: Shape {
    let points: [CGFloat]
    func path(in rect: CGRect) -> Path {
        var p = Path(); guard !points.isEmpty else { return p }
        p.move(to: CGPoint(x: 0, y: rect.height * points[0]))
        for i in points.indices.dropFirst() { p.addLine(to: CGPoint(x: rect.width * CGFloat(i) / CGFloat(points.count - 1), y: rect.height * points[i])) }
        p.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)); p.addLine(to: CGPoint(x: rect.minX, y: rect.maxY)); p.closeSubpath()
        return p
    }
}

private struct HillLines: Shape {
    func path(in r: CGRect) -> Path {
        var p = Path()
        let curves: [(CGFloat, CGFloat, CGFloat)] = [(0.9,0.48,0.2),(0.78,0.53,0.28),(0.67,0.58,0.38),(0.56,0.62,0.48),(0.45,0.66,0.6)]
        for (start, mid, end) in curves {
            p.move(to: CGPoint(x: r.minX, y: r.height * start))
            p.addCurve(to: CGPoint(x: r.maxX, y: r.height * end), control1: CGPoint(x: r.width * 0.34, y: r.height * (start - 0.12)), control2: CGPoint(x: r.width * 0.63, y: r.height * mid))
        }
        return p
    }
}

private struct Crane: View {
    let height: CGFloat
    let width: CGFloat
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle().fill(Color(red:0.22,green:0.32,blue:0.35)).frame(width: 1, height: height)
            Rectangle().fill(Color(red:0.22,green:0.32,blue:0.35)).frame(width: width, height: 1)
            Rectangle().fill(Color(red:0.22,green:0.32,blue:0.35)).frame(width: width * 0.55, height: 1).rotationEffect(.degrees(-28), anchor: .leading)
                .offset(y: height * 0.28)
        }
    }
}

struct AppleMusicConnectCard: View {
    let action: () -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 9) {
                Image(systemName: "apple.logo").font(.system(size: 16)).foregroundStyle(Palette.pine)
                Text("连接你的 Apple Music").font(.system(size: 17, weight: .regular, design: .serif)).foregroundStyle(Palette.ink)
            }
            Text("授权后即可搜索曲库，并在边注里播放歌曲。歌曲故事与播放体验放在同一个页面。")
                .font(.system(size: 13)).lineSpacing(4).foregroundStyle(Palette.secondary)
            Button(action: action) {
                Text("授权并连接").font(.system(size: 12, weight: .semibold)).foregroundStyle(Palette.surface)
                    .frame(maxWidth: .infinity).frame(height: 42).background(Palette.pine, in: Capsule())
            }.buttonStyle(.plain).padding(.top, 2)
        }
        .padding(18).paperCard()
    }
}

struct CatalogSongRow: View {
    let song: Song
    let isPlaying: Bool
    let play: () -> Void
    var body: some View {
        HStack(spacing: 12) {
            if let artwork = song.artwork {
                ArtworkImage(artwork, width: 54, height: 54).clipShape(RoundedRectangle(cornerRadius: 7))
            } else {
                RoundedRectangle(cornerRadius: 7).fill(Palette.rule).frame(width: 54, height: 54)
                    .overlay(Image(systemName: "music.note").foregroundStyle(Palette.pine))
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(song.title).font(.system(size: 14, weight: .medium)).foregroundStyle(Palette.ink).lineLimit(1)
                Text(song.artistName).font(.system(size: 12)).foregroundStyle(Palette.secondary).lineLimit(1)
                if let album = song.albumTitle {
                    Text(album).font(.system(size: 10)).foregroundStyle(Palette.secondary.opacity(0.82)).lineLimit(1)
                }
            }
            Spacer(minLength: 4)
            Button(action: play) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.system(size: 11)).foregroundStyle(Palette.pine).frame(width: 38, height: 38)
                    .background(Palette.paper, in: Circle())
            }.buttonStyle(.plain).accessibilityLabel("播放\(song.title)")
        }
        .padding(.vertical, 11)
        .overlay(alignment: .bottom) { Rectangle().fill(Palette.rule.opacity(0.6)).frame(height: 0.6) }
    }
}

struct MiniPlayer: View {
    let song: Song
    let isPlaying: Bool
    let toggle: () -> Void
    var body: some View {
        HStack(spacing: 10) {
            if let artwork = song.artwork {
                ArtworkImage(artwork, width: 42, height: 42).clipShape(RoundedRectangle(cornerRadius: 6))
            } else {
                RoundedRectangle(cornerRadius: 6).fill(Palette.rule).frame(width: 42, height: 42)
                    .overlay(Image(systemName: "music.note").font(.system(size: 13)).foregroundStyle(Palette.pine))
            }
            VStack(alignment: .leading, spacing: 3) {
                Text(song.title).font(.system(size: 12, weight: .semibold)).foregroundStyle(Palette.ink).lineLimit(1)
                Text("\(song.artistName)  ·  Apple Music").font(.system(size: 10)).foregroundStyle(Palette.secondary).lineLimit(1)
            }
            Spacer(minLength: 2)
            Button(action: toggle) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill").font(.system(size: 14)).foregroundStyle(Palette.ink)
                    .frame(width: 42, height: 42).contentShape(Rectangle())
            }.buttonStyle(.plain).accessibilityLabel(isPlaying ? "暂停" : "继续播放")
        }
        .padding(7).background(Palette.surface.opacity(0.97), in: RoundedRectangle(cornerRadius: 12))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Palette.rule.opacity(0.55), lineWidth: 0.7))
        .shadow(color: Palette.ink.opacity(0.08), radius: 10, x: 0, y: 3)
    }
}

struct StoryDetailSheet: View {
    let story: Story
    @ObservedObject var music: MusicService
    let isSaved: Bool
    let toggleSaved: () -> Void
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    StoryArtwork(story: story).frame(height: 285)
                    LinearGradient(colors: [.clear, .black.opacity(0.68)], startPoint: .center, endPoint: .bottom)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("THE STORY BEHIND").font(.system(size: 9, weight: .semibold)).tracking(2.2).foregroundStyle(.white.opacity(0.83))
                        Text(story.title).font(.system(size: 31, weight: .regular, design: .serif)).foregroundStyle(.white)
                        Text("\(story.artist)  ·  \(story.year)  ·  \(story.album)").font(.system(size: 12)).foregroundStyle(.white.opacity(0.84))
                    }.padding(22)
                }
                .overlay(alignment: .topTrailing) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark").font(.system(size: 12, weight: .semibold)).foregroundStyle(.white)
                            .frame(width: 34, height: 34).background(.black.opacity(0.34), in: Circle())
                    }.padding(15).buttonStyle(.plain)
                }
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 10) {
                        Button {
                            Task { await music.play(story: story) }
                        } label: {
                            HStack(spacing: 8) {
                                Image(systemName: "apple.logo")
                                Text(music.currentSong?.title == story.title && music.isPlaying ? "正在播放" : "Apple Music 播放")
                                Image(systemName: "play.fill").font(.system(size: 9))
                            }
                            .font(.system(size: 12, weight: .semibold)).foregroundStyle(Palette.surface)
                            .frame(maxWidth: .infinity).frame(height: 44).background(Palette.pine, in: Capsule())
                        }.buttonStyle(.plain)
                        Button(action: toggleSaved) {
                            Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                                .font(.system(size: 15)).foregroundStyle(Palette.pine).frame(width: 46, height: 44)
                                .background(Palette.paper, in: Capsule())
                        }.buttonStyle(.plain).accessibilityLabel(isSaved ? "移除书签" : "添加书签")
                    }
                    .padding(.bottom, 23)

                    HStack(spacing: 0) {
                        Fact(label: "发行年份", value: story.year)
                        Fact(label: "专辑", value: story.album)
                        Fact(label: "音乐人", value: story.artist)
                    }
                    .padding(.vertical, 14)
                    .overlay(alignment: .top) { Rectangle().fill(Palette.rule).frame(height: 0.6) }
                    .overlay(alignment: .bottom) { Rectangle().fill(Palette.rule).frame(height: 0.6) }
                    .padding(.bottom, 23)

                    Text("这首歌的故事")
                        .font(.system(size: 20, weight: .regular, design: .serif)).foregroundStyle(Palette.ink)
                        .padding(.bottom, 13)
                    ForEach(Array(story.paragraphs.enumerated()), id: \.offset) { _, paragraph in
                        Text(paragraph)
                            .font(.system(size: 15)).lineSpacing(8).foregroundStyle(Palette.ink.opacity(0.88))
                            .fixedSize(horizontal: false, vertical: true).padding(.bottom, 15)
                    }
                    HStack(spacing: 6) {
                        Image(systemName: "apple.logo")
                        Text("播放由 Apple Music 提供")
                    }.font(.system(size: 10)).foregroundStyle(Palette.secondary).padding(.top, 8).padding(.bottom, 32)
                }
                .padding(.horizontal, 22).padding(.top, 18)
            }
        }
        .background(Palette.surface)
        .ignoresSafeArea(edges: .top)
    }
}

private struct Fact: View {
    let label: String
    let value: String
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label).font(.system(size: 10)).foregroundStyle(Palette.secondary)
            Text(value).font(.system(size: 11, weight: .medium)).foregroundStyle(Palette.ink).lineLimit(1).minimumScaleFactor(0.75)
        }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 10)
            .overlay(alignment: .leading) { if label != "发行年份" { Rectangle().fill(Palette.rule).frame(width: 0.6, height: 30).offset(x: -1) } }
    }
}
