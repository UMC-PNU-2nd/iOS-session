//
//  OrDivider.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/04.
//

import UIKit

class OrDivider:UIView {
    
    lazy var orDivider = UIView()
    
    required init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("should not be in storyboard")
    }
    
    func setup() {
        addSubview(orDivider)
        orDivider.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let orLabel:UILabel = UILabel()
        orDivider.addSubview(orLabel)
        setOrLabel(orLabel)
        
        let dividerL:UIView = UIView()
        orDivider.addSubview(dividerL)
        setDividerL(dividerL, orLabel)
        
        let dividerR:UIView = UIView()
        orDivider.addSubview(dividerR)
        setDividerR(dividerR, orLabel)
    }
    
    func setOrLabel(_ orLabel: UILabel) {
        orLabel.then {
            $0.text = "또는"
            $0.font = UIFont.systemFont(ofSize: FontSize.small)
        }.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    func setDividerL(_ dividerL: UIView, _ orLabel: UILabel) {
        dividerL.then {
            $0.backgroundColor = Colors.dividerColor
        }.snp.makeConstraints {
            $0.height.equalTo(1.0)
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(orLabel.snp.leading).offset(-Spacing.middle)
        }
    }
    
    func setDividerR(_ dividerR: UIView, _ orLabel: UILabel) {
        dividerR.then {
            $0.backgroundColor = Colors.dividerColor
        }.snp.makeConstraints {
            $0.height.equalTo(1.0)
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(orLabel.snp.trailing).offset(Spacing.middle)
        }
    }
    
}
