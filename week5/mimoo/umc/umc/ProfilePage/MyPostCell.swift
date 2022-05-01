//
//  MyPostCell.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/27.
//


import UIKit

class MyPostCell:UICollectionViewCell {

    lazy var myPostCell = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("should not be in storyboard")
    }
    
    func setup() {
        contentView.addSubview(myPostCell)
        myPostCell.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        myPostCell.backgroundColor = Colors.disabledBtnColor
        
    }
    
}
