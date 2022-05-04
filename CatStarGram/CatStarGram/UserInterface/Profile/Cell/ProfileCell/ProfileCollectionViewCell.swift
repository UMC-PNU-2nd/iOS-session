//
//  ProfileCollectionViewCell.swift
//  CatStarGram
//
//  Created by 정지윤 on 2022/04/23.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    static let identifier = "ProfileCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var addProfileImageView: UIImageView!
    @IBOutlet weak var profileEditButton: UIButton!
    @IBOutlet weak var addFriendButton: UIButton!
    
    
    @IBOutlet weak var postingCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpAttribute()
    }
    
    private func setUpAttribute(){
        profileImageView.layer.cornerRadius = 88/2
        addProfileImageView.layer.cornerRadius = 24/2
        
        profileImageView.layer.borderColor = UIColor.darkGray.cgColor
        profileImageView.layer.borderWidth = 1
        
        profileEditButton.layer.cornerRadius = 5
        // Core Graphic -> CGColor
        profileEditButton.layer.borderColor = UIColor.lightGray.cgColor
        profileEditButton.layer.borderWidth = 1
       
        addFriendButton.layer.cornerRadius = 3
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        addFriendButton.layer.borderWidth = 1
        
        [postingCountLabel, followerCountLabel, followingCountLabel]
            .forEach { $0.text = "\(Int.random(in: 0...1000))"}
        
    }

}
