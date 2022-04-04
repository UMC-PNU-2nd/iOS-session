//
//  InputStackView.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/05.
//

import UIKit

class InputStackView:UIView {
    
    var inputStackView = UIStackView()
    var textFileds:[UITextField]?
    
    required init(textFileds: [UITextField]) {
        super.init(frame: .zero)
        self.textFileds = textFileds
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("should not be in storyboard")
    }
    
    func setup() {
        addSubview(inputStackView)
        inputStackView.then {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 10.0
        }.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        textFileds!.forEach {
            inputStackView.addArrangedSubview($0)
        }
    }
    
}
