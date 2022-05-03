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
                print("로딩 성공")
                viewController.successFeedAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
