//
//  MyDivider.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/04.
//

import UIKit

class MyDivider: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadView(){
        let divider = UIView()
        divider.backgroundColor = .gray
        addSubview(divider)
    }
    
}
