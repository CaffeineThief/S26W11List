//
//  SongModel.swift
//  S26W11List
//
//  Created by CaffeineThief on 11/11/26.
//

struct SongModel {
    private(set) var songs: [Song] = []
    
    mutating func addSong(_ song: Song) {
        songs.append(song)
    }
}
