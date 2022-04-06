//
//  PostCell.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/06.
//

import UIKit

class PostCell:UITableViewCell {

    lazy var postCell = UIView()
    lazy var topBarView = UIView()
    lazy var userInfoStackView = UIStackView()
    lazy var userImageBtn = UIButton()
    lazy var userNameLabel = UILabel()
    lazy var menuBtn = UIButton()
    
    lazy var images = UIView()
    
    lazy var bottomBarView = UIView()
    lazy var postBtnStackView = UIStackView()
    lazy var heartBtn = UIButton()
    lazy var commentBtn = UIButton()
    lazy var sendBtn = UIButton()
    
    lazy var bookmarkBtn = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("should not be in storyboard")
    }
    
    func setup() {
        contentView.addSubview(postCell)
        postCell.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        postCell.backgroundColor = Colors.backgroundColor
        
        postCell.addSubview(topBarView)
        setTopBarView()
        
        postCell.addSubview(images)
        setImages()
        
        postCell.addSubview(bottomBarView)
        setBottomBarView()
    }
    
    func setUserImageBtn() {
        userImageBtn.setPostProfileImageStyle(image: UIImage(named: "catImage"))
    }
    
    func setUserNameLabel() {
        userNameLabel.then {
            $0.text = "닉네임"
        }.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
    }
    
    func setUserInfoStackView() {
        userInfoStackView.then {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 10.0
        }.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10.0)
        }
        userInfoStackView.addArrangedSubview(userImageBtn)
        setUserImageBtn()
        userInfoStackView.addArrangedSubview(userNameLabel)
        setUserNameLabel()
    }
    
    func setTopBarView() {
        topBarView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(50.0)
        }
        
        topBarView.addSubview(userInfoStackView)
        setUserInfoStackView()
        
        topBarView.addSubview(menuBtn)
        menuBtn.setIconStyle(iconImage: UIImage(named: "홈/ic_home_more"))
        menuBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10.0)
        }
    }
    
    func setImages() {
        images.then {
            $0.backgroundColor = .orange
        }.snp.makeConstraints {
            $0.top.equalTo(topBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(postCell.snp.width)
        }
    }
    
    var isHeart:Bool = false
    @objc internal func clickHeart(_ sender: Any) {
        heartBtn.changeIconWithTransition(iconImage: UIImage(named: isHeart ? "홈/ic_home_heart" : "홈/ic_home_heart_full"))
        isHeart = !isHeart
    }
    
    func setPostBtns() {
        heartBtn.setIconStyle(iconImage: UIImage(named: "홈/ic_home_heart"))
        heartBtn.addTarget(self, action: #selector(clickHeart(_:)), for: .touchUpInside)
        commentBtn.setIconStyle(iconImage: UIImage(named: "홈/ic_home_comment"))
        sendBtn.setIconStyle(iconImage: UIImage(named: "홈/ic_home_send"))
        
        postBtnStackView.addArrangedSubview(heartBtn)
        postBtnStackView.addArrangedSubview(commentBtn)
        postBtnStackView.addArrangedSubview(sendBtn)
    }
    
    func setPostBtnStackView() {
        postBtnStackView.then {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 20.0
        }.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10.0)
        }
        setPostBtns()
    }
    
    func setBottomBarView() {
        bottomBarView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(images.snp.bottom)
            $0.height.equalTo(50.0)
        }
        bottomBarView.addSubview(postBtnStackView)
        setPostBtnStackView()
        
        bottomBarView.addSubview(bookmarkBtn)
        bookmarkBtn.setIconStyle(iconImage: UIImage(named: "홈/ic_bookmark_white"))
        bookmarkBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
    
    
}
