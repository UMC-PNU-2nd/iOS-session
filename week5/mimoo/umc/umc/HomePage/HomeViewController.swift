//
//  HomeViewController.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/06.
//

import UIKit
import SnapKit
import Then

import RxCocoa
import RxSwift

class HomeViewController: UIViewController {
    
    lazy var myNaviBarStackView = UIStackView()
    lazy var logoImageView = UIImageView()
    lazy var naviBtnStackView = UIStackView()
    lazy var uploadBtn = UIButton()
    lazy var heartBtn = UIButton()
    lazy var sendBtn = UIButton()
    
    lazy var tableView = MyTableView(frame: .zero, style: .grouped)
    lazy var storyCollectionView:StoryCollectionView = {
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = Spacing.middle
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return StoryCollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    }()
    
    func setLogoImageView() {
        logoImageView.then {
            $0.image = UIImage(named: "ic_catstagram_logo")?.resizeWithWidthAspectRatio(width: UIScreen.main.bounds.width * 0.35)
            $0.contentMode = .scaleAspectFit
        }.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
    }
    
    func setNaviBtns() {
        uploadBtn.setIconStyle(iconImage: UIImage(named: "홈/ic_home_upload"))
        heartBtn.setIconStyle(iconImage: UIImage(named: "홈/ic_home_heart"))
        sendBtn.setIconStyle(iconImage: UIImage(named: "홈/ic_home_send"))
        
        naviBtnStackView.addArrangedSubview(uploadBtn)
        naviBtnStackView.addArrangedSubview(heartBtn)
        naviBtnStackView.addArrangedSubview(sendBtn)
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
        
        myNaviBarStackView.addArrangedSubview(logoImageView)
        setLogoImageView()
        myNaviBarStackView.addArrangedSubview(naviBtnStackView)
        setNaviBtnStackView()
    }
    
    func tableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    func configureTableView() {
        tableView.delaysContentTouches = false
        tableView.canCancelContentTouches = true
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    func setTableView() {
        tableViewDelegate()
        configureTableView()
        
        tableView.register(PostCell.classForCoder(), forCellReuseIdentifier: "PostCell")
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(myNaviBarStackView.snp.bottom).offset(5.0)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setStoryCollectionView() {
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        
        storyCollectionView.showsHorizontalScrollIndicator = false
        storyCollectionView.register(StoryCell.classForCoder(), forCellWithReuseIdentifier: "StoryCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        
        setMyNaviBarStackView()
        
        self.view.addSubview(tableView)
        setTableView()
        
        setStoryCollectionView()
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return storyCollectionView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return StoryCellSize.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
}

class MyTableView: UITableView {
    override func touchesShouldCancel(in view: UIView) -> Bool {
        if view is UIButton {
            return true
        }
        return super.touchesShouldCancel(in: view)
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: StoryCellSize.width, height: StoryCellSize.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
        return cell
    }
    
}

class StoryCollectionView: UICollectionView {

}
