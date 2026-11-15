import Foundation

struct Story: Identifiable, Hashable {
    let id: String
    let title: String
    let artist: String
    let album: String
    let year: String
    let dek: String
    let paragraphs: [String]
    var searchTerm: String { "\(title) \(artist)" }
}

enum StoryLibrary {
    static let all: [Story] = [
        Story(id: "pink-moon", title: "Pink Moon", artist: "Nick Drake", album: "Pink Moon", year: "1972", dek: "两个夜晚，一把吉他。", paragraphs: [
            "1971 年秋，Nick Drake 在伦敦只录了两个夜晚。他把能拿掉的都拿掉了，最后剩下吉他和他的声音。《Pink Moon》短，也几乎不肯被解释。",
            "月亮在这里不是情歌的布景，更像一盏亮着、却不打算靠近的灯。这张专辑当时没有被多少人接住。几十年后，人们反而学会把音量调低，在这点光里坐一会儿。"
        ]),
        Story(id: "landslide", title: "Landslide", artist: "Fleetwood Mac", album: "Fleetwood Mac", year: "1975", dek: "山还在，路要自己选。", paragraphs: [
            "歌是在科罗拉多的山里写成的。Stevie Nicks 看着那些山，问自己还要不要继续走音乐这条路。那时后头还没有那么大的名声，选择本身更重。",
            "1975 年，它被收进专辑《Fleetwood Mac》。吉他一直很轻，像坐在旁边，并不催促。歌里没有给出方向，只留下时间：人还没想清楚自己是谁，日子已经在往前走。",
            "很多人会在自己的路口听见它。旋律没有变，听的人却会忽然算出自己的年纪。"
        ]),
        Story(id: "by-your-side", title: "By Your Side", artist: "Sade", album: "Lovers Rock", year: "2000", dek: "不解释爱，只说明在场。", paragraphs: [
            "Sade 几乎不抬高声音。《By Your Side》收在 2000 年的《Lovers Rock》里，像一句放在桌角的话：不必一个人留在这儿。",
            "贝斯走得很慢，人声靠得很近。它不去定义爱，只做一件更难一直做到的事——留在原地。整支乐队保持着惯有的克制，让安静承担大部分工作。",
            "若要认真听，最好别同时做太多别的。低音会把房间拉慢，慢到你得决定，要不要真的陪着谁。"
        ]),
        Story(id: "hill", title: "山丘", artist: "李宗盛", album: "山丘", year: "2013", dek: "走到一半，才回头看。", paragraphs: [
            "李宗盛唱《山丘》时，声音里已经有走路走出来的砂。这首歌不急着安慰人。它只是把一个走到半途、终于愿意回头的下午摊开。",
            "吉他像步伐，一句一句，不赶。有些话年轻时没说出口，后来也未必补得上。他仍把那段上坡再走了一遍，走得很慢，好让听的人把自己的路也放进来。",
            "适合开着，却不必跟着唱。像有人在对面坐下，并不要求你马上回答。"
        ]),
        Story(id: "holocene", title: "Holocene", artist: "Bon Iver", album: "Bon Iver, Bon Iver", year: "2011", dek: "人很小，记忆却很具体。", paragraphs: [
            "Bon Iver 用我们所在的地质年代给这首歌命名。人被放进一段长得几乎可以忽略个人的时间里。可歌里记得住的，反而是某处的光，某一次没有说出口的离开。",
            "Justin Vernon 把声音叠得很薄，像冷天停在湖面上的雾。很大的尺度，最后只托住一件小事：你确实在那里站过。",
            "标题来自地质学，歌本身却几乎不谈知识。它谈的是，在很长的时间旁边，一个普通人的下午仍然算数。"
        ]),
        Story(id: "cranes", title: "Cranes in the Sky", artist: "Solange", album: "A Seat at the Table", year: "2016", dek: "用忙碌，躲开一种情绪。", paragraphs: [
            "《Cranes in the Sky》在 Solange 心里放了多年，才落进 2016 年的《A Seat at the Table》。旋律慢，也不肯随便给一个松开的副歌。",
            "歌名里的 crane，可以听成天上的鸟，也可以听成城市里一直升着的吊臂。她写的是一种停不下来的忙：用工作，用远行，用不断地移动，绕开一个还没准备好面对的心情。",
            "听完未必觉得被安慰。它只是把那条绕开的路线画出来，让人看见自己也在上面。"
        ]),
        Story(id: "mine", title: "My Love Mine All Mine", artist: "Mitski", album: "The Land Is Inhospitable and So Are We", year: "2023", dek: "留得住的，也许只有爱。", paragraphs: [
            "在《The Land Is Inhospitable and So Are We》里，Mitski 把声音放回更靠近土地的地方。这首歌很短，站得却稳。踏板吉他把夜色拉长，人声不炫耀，像把一句话放到枕边。",
            "月亮在歌里只负责作证。许多东西最终留不住。若还有什么真的算作自己的，也许只是曾经认真付出的爱。",
            "短歌容易被听成一句口号。这一首不是。它把「属于我」说得很轻，轻到更像夜里的自言自语。"
        ])
    ]
}
