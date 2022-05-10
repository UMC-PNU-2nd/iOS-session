//
//  MyPostCell.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/27.
//


import UIKit
import Kingfisher

class MyFeedCell:UICollectionViewCell {

    lazy var myPostCell = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("should not be in storyboard")
    }
    
    func setup(_ imageUrlString: String?) {
        contentView.addSubview(myPostCell)
        
        guard let imageUrlString = imageUrlString else { return }
        
        if let url = URL(string: imageUrlString) {
            myPostCell.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        }
        
        myPostCell.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        myPostCell.backgroundColor = Colors.disabledBtnColor
        
    }
    
}
