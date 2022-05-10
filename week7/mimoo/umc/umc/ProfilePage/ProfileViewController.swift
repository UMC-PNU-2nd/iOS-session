//
//  ProfileViewController.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/26.
//

import UIKit
import SnapKit
import Then

import RxCocoa
import RxSwift

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    
    private var refresh_control = UIRefreshControl()
    
    let postSpacing:Double = 3.0

    var userPosts: [GetUserPost]?
    var deletedIndex:Int?
    
    lazy var myNaviBarStackView = UIStackView()
    lazy var nickNameBtn = UIButton()
    lazy var naviBtnStackView = UIStackView()
    lazy var uploadBtn = UIButton()
    lazy var menuBtn = UIButton()
    
    lazy var myCollectionView:MyCollectionView = {
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = postSpacing
        flowLayout.minimumLineSpacing = postSpacing
        return MyCollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    }()
    
    func setNickNameBtn() {
        nickNameBtn.then {
            $0.setTitle("NickName", for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.big, weight: .bold)
            $0.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    func setNaviBtns() {
        uploadBtn.setIconStyle(iconImage: UIImage(named: "마이/ic_my_upload"))
        menuBtn.setIconStyle(iconImage: UIImage(named: "마이/ic_my_hamburger"))
        
        naviBtnStackView.addArrangedSubview(uploadBtn)
        naviBtnStackView.addArrangedSubview(menuBtn)
    }
    
    func setNaviBtnStackView() {
        naviBtnStackView.then {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 20.0
        }.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
        setNaviBtns()
    }
    
    func setMyNaviBarStackView() {
        self.view.addSubview(myNaviBarStackView)
        myNaviBarStackView.then {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.alignment = .center
        }.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
                .inset(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        myNaviBarStackView.addArrangedSubview(nickNameBtn)
        setNickNameBtn()
        myNaviBarStackView.addArrangedSubview(naviBtnStackView)
        setNaviBtnStackView()
    }
    
    @objc
    func didLongPressCell(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state != .began { return }
        let position = gestureRecognizer.location(in: myCollectionView)
        if let indexPath = myCollectionView.indexPathForItem(at: position) {
            guard let userPosts = self.userPosts else { return }
            let cellData = userPosts[indexPath.item]
            
            if let postIdx = cellData.postIdx {
                self.deletedIndex = indexPath.item
                UserFeedDataManager().deleteUserFeed(self, postIdx)
            }
        }
    }
    
    func setCollectionView() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        myCollectionView.showsVerticalScrollIndicator = false
        
        myCollectionView.register(ProfileCell.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileCell")
        
        myCollectionView.register(MyFeedCell.classForCoder(), forCellWithReuseIdentifier: "MyPostCell")
        
        myCollectionView.snp.makeConstraints {
            $0.top.equalTo(myNaviBarStackView.snp.bottom).offset(5.0)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(didLongPressCell(gestureRecognizer:)))
        gesture.minimumPressDuration = 0.66
        gesture.delegate = self
        gesture.delaysTouchesBegan = true
        myCollectionView.addGestureRecognizer(gesture)
    }
    
    func setUpData() {
        UserFeedDataManager().getUserFeed(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        
        setMyNaviBarStackView()
        
        self.view.addSubview(myCollectionView)
        setCollectionView()
        refreshControl()
        setUpData()
    }
    
}

extension ProfileViewController {
    func successFeedAPI(_ result: UserFeedModel) {
        refrechControlEnd()
        userPosts = result.result?.getUserPosts
        myCollectionView.reloadData()
    }
    func successDeletePostAPI(_ isSuccess: Bool) {
        if let deletedIndex = self.deletedIndex {
            self.userPosts?.remove(at: deletedIndex)
            myCollectionView.reloadData()
        }
    }
}

extension ProfileViewController {
    private func refreshControl() {
        if #available(iOS 10.0, *) {
            myCollectionView.refreshControl = refresh_control
        }
        else {
            myCollectionView.addSubview(refresh_control)
            
        }
        refresh_control.tintColor = .black
        refresh_control.addTarget(self, action: #selector(initRefresh), for: .valueChanged)
    }
    @objc func initRefresh() {
        setUpData()
    }
    
    func refrechControlEnd() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { self.refresh_control.endRefreshing()
        }
    }

}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - postSpacing * 2) / 3.0
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPosts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = collectionView.frame.height / 4.0
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
                return headerView
            default: assert(false, "only header")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "MyPostCell", for: indexPath) as! MyFeedCell
        let index = indexPath.item
        if let cellData = self.userPosts {
            cell.setup(userPosts?[index].postImgUrl)
        }
        return cell
    }
    
}

class MyCollectionView: UICollectionView {

}
