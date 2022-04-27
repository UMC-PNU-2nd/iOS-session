//
//  ProfileCell.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/26.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    lazy var profileCell = UIView()
    lazy var verticalStackView = UIStackView()
    
    lazy var rowStackView1 = UIStackView()
    lazy var userImageBtn = UIButton()
    lazy var numsStackView = UIStackView()
    lazy var postsNumBtn = UIButton()
    lazy var followerNumBtn = UIButton()
    lazy var followingNumBtn = UIButton()
    
    lazy var descriptionLabel = UILabel()
    
    lazy var rowStackView2 = UIStackView()
    lazy var editProfileBtn = UIButton()
    lazy var inviteBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("should not be in storyboard")
    }
    
    func setup() {
        contentView.addSubview(profileCell)
        profileCell.backgroundColor = .gray
        profileCell.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        profileCell.backgroundColor = Colors.backgroundColor
        
        profileCell.addSubview(verticalStackView)
        setVerticalStackView()
        
    }
    
    func setVerticalStackView() {
        verticalStackView.then {
            $0.axis = .vertical
            $0.distribution = .equalSpacing
            $0.alignment = .leading
        }.snp.makeConstraints {
            $0.edges.equalToSuperview()
                .inset(UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10))
        }
        
        verticalStackView.addArrangedSubview(rowStackView1)
        setRowStackView1()
        
        verticalStackView.addArrangedSubview(descriptionLabel)
        descriptionLabel.then{
            $0.text = "description"
        }
        
        verticalStackView.addArrangedSubview(rowStackView2)
        setRowStackView2()
        
    }
    
    func setRowStackView1() {
        rowStackView1.then {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
        }.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        rowStackView1.addArrangedSubview(userImageBtn)
        setUserImageBtn()
        
        rowStackView1.addArrangedSubview(numsStackView)
        setNumStackView()
    }
    
    func setUserImageBtn() {
        userImageBtn.then {
            $0.setMyProfileImageStyle(image: UIImage(named: "catImage"))
        }.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(ProfileImageSize.big.width)
        }
    }
    
    func setNumStackView() {
        numsStackView.then {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.alignment = .center
        }.snp.makeConstraints {
            $0.leading.equalTo(userImageBtn.snp.trailing)
            $0.trailing.equalToSuperview()
        }
        numsStackView.addArrangedSubview(postsNumBtn)
        numsStackView.addArrangedSubview(followerNumBtn)
        numsStackView.addArrangedSubview(followingNumBtn)
        
        setPostsNumBtn()
        setFollowerNumBtn()
        setFollowingNumBtn()
    }
    
    func setPostsNumBtn() {
        postsNumBtn.then {
            $0.setTwoLinesTextStyle("100", "게시물")
        }
    }
    func setFollowerNumBtn() {
        followerNumBtn.then {
            $0.setTwoLinesTextStyle("100", "팔로워")
        }
    }
    func setFollowingNumBtn() {
        followingNumBtn.then {
            $0.setTwoLinesTextStyle("100", "팔로잉")
        }
    }
    
    func setRowStackView2() {
        rowStackView2.then {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.alignment = .center
        }.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
        
        rowStackView2.addArrangedSubview(editProfileBtn)
        rowStackView2.addArrangedSubview(inviteBtn)
        setEditProfileBtn()
        setFindPeopleBtn()
    }
    
    func setEditProfileBtn() {
        editProfileBtn .then {
            $0.setTitle("프로필 편집", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.setRoundedBorderStyle()
        }.snp.makeConstraints {
            $0.trailing.equalTo(inviteBtn.snp.leading).offset(-10)
        }
    }
    
    func setFindPeopleBtn() {
        inviteBtn.then {
            $0.setIconStyle(iconImage: UIImage(named: "마이/ic_my_invite"))
            $0.setRoundedBorderStyle()
        }.snp.makeConstraints {
            $0.width.height.equalTo(editProfileBtn.snp.height)
        }
    }
    
}
