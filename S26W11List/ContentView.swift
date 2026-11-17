//
//  ContentView.swift
//  S26W11List
//
//  Created by CaffeineThief on 11/11/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SongListView()
    }
}

struct SongListView: View {
    @State private var viewModel = SongViewModel(
        SongModel(songs: [ // init을 하지 않았기 떄문에 songs: 를 사용함 안쓰려면 init으로 추가할 것
            // 아래에걸 의존성 주입이라함
            Song(/*id: 1,*/title: "Supernova Blue", artist: "NEXUS"),
            Song(/*id: 2,*/title: "밤하늘 비행 (Night Flight)", artist: "민서 (MINSEO)"),
            Song(/*id: 3,*/title: "Heart Lock", artist: "CHERRY BOMB")
        ])
    )
    
    var body: some View {
        List { // \.id는 song에 있는 id를 쓰겠다 라는 뜻
            ForEach(viewModel.songs/*, id: \.id*/) { song in // song ->랑 같은 것, 클로저(람다식)
//                VStack(
//                    alignment: .leading, //leading은 왼쪽 정렬, trailing은 오른쪽 정렬
//                    spacing: 16,
//                ) {
//                    Text(song.title)
//                        .font(.headline)
//                        .foregroundColor(.blue) // 자동으로 붙여줌 원래는 Color.blue임
//                    Text(song.artist)
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                }
                SongItem(song: song)
            }
        }
    }
}

struct SongItem: View {
    let song: Song
    
    var body: some View {
        HStack(spacing: 16){
            ImageAlbum(albumUrl: makeAlbumUrl(song.id))
            
            VStack(
                alignment: .leading,
                spacing: 16,
            ) {
                Text(song.title)
                    .font(.headline)
                    .foregroundColor(.blue)
                Text(song.artist)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

//func makeAlbumUrl(_ id: UUID) -> URL {
//    URL(string: "https://picsum.photos/80/80?random=\(id)")!
//}
let makeAlbumUrl: (UUID) -> URL = {
    URL(string: "https://picsum.photos/80/80?random=\($0)")! // !는 확실하게 nil이 아니라는 것을 의미
}

struct ImageAlbum: View {
    let albumUrl: URL
    
    var body: some View {
        AsyncImage(url: albumUrl) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
        }
    }
}

#Preview {
    ContentView()
}
