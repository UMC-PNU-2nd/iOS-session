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

class ProfileViewController: UIViewController {
    let postSpacing:Double = 3.0

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
    
    func setStoryCollectionView() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        myCollectionView.showsVerticalScrollIndicator = false
        
        myCollectionView.register(ProfileCell.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileCell")
        
        myCollectionView.register(MyPostCell.classForCoder(), forCellWithReuseIdentifier: "MyPostCell")
        
        myCollectionView.snp.makeConstraints {
            $0.top.equalTo(myNaviBarStackView.snp.bottom).offset(5.0)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        
        setMyNaviBarStackView()
        
        self.view.addSubview(myCollectionView)
        setStoryCollectionView()
    }
    
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - postSpacing * 2) / 3.0
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
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
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "MyPostCell", for: indexPath) as! MyPostCell
        return cell
    }
    
}

class MyCollectionView: UICollectionView {

}
