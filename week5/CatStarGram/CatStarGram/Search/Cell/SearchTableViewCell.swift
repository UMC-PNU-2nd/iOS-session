//
//  SearchTableViewCell.swift
//  CatStarGram
//
//  Created by 정지윤 on 2022/04/27.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    static let identifier = "SearchTableViewCell"
    
    @IBOutlet weak var searchTableImg: UIImageView!
    @IBOutlet weak var searchTableID: UILabel!
    @IBOutlet weak var searchTableName: UILabel!
    @IBOutlet weak var searchTableFollowingOrNot: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteFromList(_ sender: Any) {
    }
    
    
}
