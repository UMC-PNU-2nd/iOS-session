//
//  HomeViewController.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/06.
//
import UIKit
import SnapKit
import Then

class FeedCell: UITableViewCell {
    var userIconView = UIImageView().then {
        $0.image = UIImage(systemName: "person.circle")
        $0.tintColor = UIColor.gray
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var usernameView = UILabel().then {
        $0.text = "Lorem Ipsum"
        $0.font = UIFont.systemFont(ofSize: 17, weight: .light)
    }
    var feedImageView = UIImageView().then {
        $0.image = UIImage(named: "feed")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell() {
        contentView.snp.makeConstraints {
            $0.height.equalTo(500)
        }
        setUserIcon()
        setUsername()
        setFeedImage()
    }
    
    func setUserIcon() {
        self.addSubview(userIconView)
        userIconView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(0.1)
            $0.width.equalToSuperview().multipliedBy(0.1)
            $0.left.equalToSuperview().offset(10)
            $0.top.equalToSuperview()
        }
    }
    
    func setUsername() {
        self.addSubview(usernameView)
        usernameView.snp.makeConstraints {
            $0.left.equalTo(userIconView.snp.right).offset(10)
            $0.centerY.equalTo(userIconView)
        }
    }
    
    func setFeedImage() {
        self.addSubview(feedImageView)
        
        feedImageView.snp.makeConstraints {
            $0.left.equalTo(self.snp.left)
            $0.top.equalTo(userIconView.snp.bottom).offset(10)
            $0.width.equalTo(self.snp.width)
            $0.height.equalTo(contentView.snp.height).multipliedBy(0.8)
        }
    }
}

class HomeViewController: UIViewController {
    
    let topNavigationBar = UIView().then {
        $0.backgroundColor = .black.withAlphaComponent(0.5)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let uploadButton = UIImageView().then {
        $0.image = UIImage(named: "ic_home_upload")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let likeButton = UIImageView().then {
        $0.image = UIImage(named: "ic_home_heart")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let dmButton = UIImageView().then {
        $0.image = UIImage(named: "ic_home_send")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let tableView = UITableView().then {
        $0.separatorStyle = .none
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setTopNavigationBar()
        setTableView()
    }
    
    func setTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(topNavigationBar.snp.bottom)
            $0.left.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setTopNavigationBar() {
        
        let logoImage = UIImageView().then {
            $0.image = UIImage(named: "ic_catstagram_logo")
            $0.contentMode = .scaleAspectFit
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        view.addSubview(topNavigationBar)
        
        topNavigationBar.addSubview(logoImage)
        topNavigationBar.addSubview(uploadButton)
        topNavigationBar.addSubview(likeButton)
        topNavigationBar.addSubview(dmButton)
        
        topNavigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            $0.width.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.1)
            $0.left.equalTo(view.safeAreaLayoutGuide)
        }

        logoImage.snp.makeConstraints {
            $0.width.equalTo(topNavigationBar.snp.width).dividedBy(2.5)
            $0.centerY.equalTo(topNavigationBar.snp.centerY)
            $0.left.equalTo(topNavigationBar).offset(10)
        }

        uploadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.35)
            $0.centerX.equalToSuperview().multipliedBy(1.3)
        }

        likeButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.35)
            $0.centerX.equalTo(uploadButton.snp.centerX).multipliedBy(1.2)
        }

        dmButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.35)
            $0.centerX.equalTo(uploadButton.snp.centerX).multipliedBy(1.4)
        }
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FeedCell()
        return cell
    }
}

import SwiftUI

struct HomeViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = HomeViewController
    
    func makeUIViewController(context: Context) -> HomeViewController {
        return HomeViewController()
    }
    
    func updateUIViewController(_ uiViewController: HomeViewController, context: Context) {}
}

struct HomeViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            HomeViewControllerRepresentable()
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
                .previewDisplayName("iPhone 13 Pro")
            
            HomeViewControllerRepresentable()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}







