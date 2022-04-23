//
//  HomeViewController.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/06.
//
import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {
    
    let topNavigationBar = UIView().then {
        $0.backgroundColor = .white
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
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .white
        setTopNavigationBar()
        setTableView()
    }
    
    func setTableView() {
        tableView.register(FeedViewCell.self, forCellReuseIdentifier: "FeedViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(topNavigationBar.snp.bottom)
            $0.left.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalToSuperview()
        }
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
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.1)
            $0.left.equalTo(view.safeAreaLayoutGuide)
        }
        
        logoImage.snp.makeConstraints {
            $0.width.equalTo(topNavigationBar).dividedBy(2.5)
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










