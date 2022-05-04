//
//  FeedUploadModel.swift
//  CatStarGram
//
//  Created by 정지윤 on 2022/05/02.
//

struct FeedUploadModel : Decodable {
    var result : FeedUploadResult
    var isSuccess : Bool
    var code : Int
    var message : String
}

struct FeedUploadResult : Decodable {
    var postIdx : Int?
}
