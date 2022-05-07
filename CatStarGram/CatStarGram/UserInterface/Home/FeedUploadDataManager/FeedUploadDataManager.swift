//
//  FeedUploadDataManager.swift
//  CatStarGram
//
//  Created by 정지윤 on 2022/05/02.
//

import Foundation
import Alamofire

class FeedUploadDataManager{
    func posts(_ viewController : HomeViewController, _ parameter: FeedUploadInput) {
        //url-> base url + 추가할 url
        AF.request("https://edu-api-ios-test.softsquared.com/posts", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil).validate().responseDecodable(of: FeedUploadModel.self) { response in
            
            switch response.result {
            case .success(let result):
                if result.isSuccess{
                    print("업로드 성공")
                } else {
                    print(result.message)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
