//
//  StoryCell.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/06.
//

import UIKit

class StoryCell: UICollectionViewCell {
    
    lazy var storyCell = UIView()
    lazy var userImageBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("should not be in storyboard")
    }
    
    func setup() {
        contentView.addSubview(storyCell)
        storyCell.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        storyCell.backgroundColor = Colors.backgroundColor
        
        storyCell.addSubview(userImageBtn)
        setUserImageBtn()
        userImageBtn.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(StoryCellSize.profileImageBtnWidth)
        }
    }
    
    func setUserImageBtn() {
        userImageBtn.setStoryProfileImageStyle(image: UIImage(named: "catImage"))
    }
    
}
