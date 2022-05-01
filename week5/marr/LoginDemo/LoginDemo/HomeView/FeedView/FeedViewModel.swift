//
//  FeedViewModel.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/07.
//

import Foundation
import RxCocoa
import RxSwift

class FeedViewModel {
    let disposeBag = DisposeBag()
    let feedSubject = BehaviorRelay<FeedModel?>(value: FeedModel())
    let likeSubject = BehaviorRelay<Bool?>(value: false)
    
    var isLike: Observable<Bool> {
        return likeSubject.map { value in
            return value!
        }
    }
}
