//
//  PosrCollectionViewCell.swift
//  CatStarGram
//
//  Created by 정지윤 on 2022/04/23.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PostCollectionViewCell"
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    public func setUpData() {
        // 이미지뷰의 이미지를 업로드한다.
    }
}
