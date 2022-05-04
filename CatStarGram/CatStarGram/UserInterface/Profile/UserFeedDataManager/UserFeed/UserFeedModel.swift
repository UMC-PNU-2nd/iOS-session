// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct UserFeedModel:Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: Result
}

// MARK: - Result
struct Result: Decodable {
    let isMyFeed: Bool?
    let getUserInfo: GetUserInfo
    let getUserPosts: [GetUserPost]
}

// MARK: - GetUserInfo
struct GetUserInfo: Decodable {
    let userIdx: Int?
    let nickName, name: String?
    let profileImgURL: String?
    let website: String?
    let introduction: String?
    let followerCount, followingCount, postCount: Int?
}

// MARK: - GetUserPost
struct GetUserPost: Decodable{
    let postIdx: Int?
    let postImgURL: String?
}
