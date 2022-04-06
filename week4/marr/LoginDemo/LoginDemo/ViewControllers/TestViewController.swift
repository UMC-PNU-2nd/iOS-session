//
//  TestViewController.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/06.
//

import Foundation
import UIKit
import SnapKit
import Then
import RxSwift
import RxRelay

class TestViewController: UIViewController {
    
    let feedView = UIView().then {
        $0.layer.cornerRadius = 0
        $0.backgroundColor = .black.withAlphaComponent(0.25)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setFeedView()
    }
    
    func setFeedView() {
        view.addSubview(feedView)
        feedView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.height.equalToSuperview().multipliedBy(0.3)
        }
        
    }
}

import SwiftUI

struct TestViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = TestViewController
    
    func makeUIViewController(context: Context) -> TestViewController {
        return TestViewController()
    }
    
    func updateUIViewController(_ uiViewController: TestViewController, context: Context) {}
}

struct TestViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            TestViewControllerRepresentable()
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
                .previewDisplayName("iPhone 13 Pro")
            
            TestViewControllerRepresentable()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}








