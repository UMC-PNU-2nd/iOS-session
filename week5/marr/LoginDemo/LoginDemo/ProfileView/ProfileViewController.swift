//
//  ProfileViewController.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/27.
//

import Foundation
import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift

class ProfileViewController: UIViewController {
    
    let usernameBarButton = UIBarButtonItem(title: "Nickname")
    
    let plusBarButton = UIBarButtonItem(image:UIImage(systemName: "plus.app"))
    
    let menuBarButton = UIBarButtonItem(image:UIImage(systemName: "line.3.horizontal"))
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
                
            $0.backgroundColor = UIColor(named: "Facebook_color")
            $0.contentInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
            $0.showsHorizontalScrollIndicator = false
            $0.collectionViewLayout = layout
            $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        view.backgroundColor = .white
        setNavigationBar()
        setCollectionView()
    }
    
    func setNavigationBar() {
        [usernameBarButton, menuBarButton, plusBarButton].forEach {
            $0.tintColor = .black
        }
        
        navigationItem.leftBarButtonItem = usernameBarButton
        navigationItem.rightBarButtonItems = [menuBarButton, plusBarButton]
    }
    
    func setCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

import SwiftUI

struct ProfileViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ProfileViewController
    
    func makeUIViewController(context: Context) -> ProfileViewController {
        return ProfileViewController()
    }
    
    func updateUIViewController(_ uiViewController: ProfileViewController, context: Context) {}
}

struct ProfileViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileViewControllerRepresentable()
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
                .previewDisplayName("iPhone 13 Pro")
            
            ProfileViewControllerRepresentable()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}


