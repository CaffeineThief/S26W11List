//
//  Song.swift
//  S26W11List
//
//  Created by CaffeineThief on 11/11/26.
//

import Foundation

struct Song: Identifiable {
    let id = UUID() // id:UUID = UUID()에서 생략된 것. 당연한 것이기 떄문에
    let title: String
    let artist: String
}
