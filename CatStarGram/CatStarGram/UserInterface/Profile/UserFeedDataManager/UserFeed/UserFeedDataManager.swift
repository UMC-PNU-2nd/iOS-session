//
//  FeedDataManager.swift
//  CatStarGram
//
//  Created by 정지윤 on 2022/05/01.
//

import Foundation
import Alamofire

class UserFeedDataManager {
    
    //유저 피드 조회 API
    func getUserFeed(_ viewController: ProfileViewController,
                     _ userID: Int = 2) {
        
        //통신
        AF.request("https://edu-api-ios-test.softsquared.com/users/\(userID)",
                   method: .get,
                   parameters: nil)
        .validate()
        .responseDecodable(of: UserFeedModel.self) { response in
            switch response.result{
            case .success(let result):
                print("조회 성공")
                viewController.successFeedAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //게시물 삭제 API
    func deleteUserFeed(_ viewController: ProfileViewController,
                     _ postIdx: Int) {
        
        //게시
        AF.request("https://edu-api-ios-test.softsquared.com/posts/\(postIdx)/status",
                   method: .patch,
                   parameters: nil)
        .validate()
        .responseDecodable(of: DeleteUserFeed.self) { response in
            switch response.result{
            case .success(let result):
                viewController.successDeletePostAPI(result.isSuccess ?? false)
                print("삭제 성공")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
