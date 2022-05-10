//
//  UserFeedDataManager.swift
//  umc
//
//  Created by Yujin Cha on 2022/05/03.
//

import Alamofire

class UserFeedDataManager {
    func getUserFeed(_ viewController: ProfileViewController, _ userID: Int = 2) {
        AF.request("https://edu-api-ios-test.softsquared.com/users/\(userID)", method: .get, parameters: nil).validate().responseDecodable(of: UserFeedModel.self) { response in
            switch response.result {
            case .success(let result):
                viewController.successFeedAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteUserFeed(_ viewController: ProfileViewController, _ postIdx: Int) {
        AF.request("https://edu-api-ios-test.softsquared.com/posts/\(postIdx)/status", method: .patch, parameters: nil).validate().responseDecodable(of: DeleteUserFeedModel.self) { response in
            switch response.result {
            case .success(let result):
                viewController.successDeletePostAPI(result.isSuccess ?? false)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
