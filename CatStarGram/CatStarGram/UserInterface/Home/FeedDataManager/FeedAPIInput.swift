//
//  FeedAPIInput.swift
//  CatStarGram
//
//  Created by 정지윤 on 2022/05/01.
//

import Foundation

struct FeedAPIInput : Encodable {
    var limit: Int?
    var page: Int?
}
