//
//  Extensions.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/07.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    var userNames: [String] {
        return ["이준영", "정지윤", "김가희", "전승윤", "홍유준"]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedViewCell") as! FeedViewCell
        cell.usernameView.text = userNames[indexPath.row]
        return cell
    }
}

