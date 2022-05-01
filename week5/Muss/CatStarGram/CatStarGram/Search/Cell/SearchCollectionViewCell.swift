//
//  SearchCollectionViewCell.swift
//  CatStarGram
//
//  Created by 정지윤 on 2022/04/27.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SearchCollectionViewCell"
    @IBOutlet weak var searchImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setUpData() {
        // 이미지뷰의 이미지를 업로드한다.
    }

}
