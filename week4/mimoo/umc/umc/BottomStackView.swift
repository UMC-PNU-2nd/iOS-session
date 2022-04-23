//
//  BottomStackView.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/04.
//

import UIKit

class BottomStackView:UIView {
    
    var bottomStackView = UIStackView()
    var btn:UIButton?
    
    required init(button: UIButton) {
        super.init(frame: .zero)
        btn = button
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("should not be in storyboard")
    }
    
    func setup() {
        addSubview(bottomStackView)
        bottomStackView.then {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 10.0
        }.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-70)
        }
        
        let divider:UIView = UIView()
        bottomStackView.addArrangedSubview(divider)
        setDivider(divider)
        
        bottomStackView.addArrangedSubview(btn!)
        setBtn()
    }
    
    func setDivider(_ divider: UIView) {
        divider.then {
            $0.backgroundColor = UIColor(named: "colors/dividerColor")
        }.snp.makeConstraints {
            $0.height.equalTo(1.0)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func setBtn() {
        btn!.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
        }
    }
    
}
