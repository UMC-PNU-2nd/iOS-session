//
//  FeedUploadModel.swift
//  umc
//
//  Created by Yujin Cha on 2022/05/03.
//

struct FeedUploadModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: FeedUploadResult?
}

struct FeedUploadResult: Decodable {
    var postIdx: Int?
}
