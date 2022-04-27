//
//  FacebookLoginBtn.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/05.
//

import UIKit

class FacebookLoginBtn:UIView {
    var facebookLoginBtn = UIButton()
    var passedJob: () -> Void = {}
    
    required init(buttonFunc: @escaping () -> Void) {
        super.init(frame: .zero)
        setup()
        passedJob = buttonFunc
        facebookLoginBtn.addTarget(self, action: #selector(btnFunc(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("should not be in storyboard")
    }
    
    @objc internal func btnFunc(_ sender: Any) {
        passedJob()
    }
    
    func setup() {
        addSubview(facebookLoginBtn)
        facebookLoginBtn.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        let facebookIcon:UIImage? = UIImage(named: "로그인/ic_login_facebook")?.resizeTo(size: CGSize(width: 20.0, height: 20.0))
        facebookLoginBtn.setTitle("  Facebook으로 로그인", for: .normal)
        facebookLoginBtn.setTitleColor(Colors.textBtnLabelColor, for: .normal)
        facebookLoginBtn.setImage(facebookIcon, for: .normal)
        facebookLoginBtn.setImage(facebookIcon, for: .highlighted)
        facebookLoginBtn.layer.cornerRadius = 10.0
        facebookLoginBtn.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.middle, weight: UIFont.Weight.bold)
        facebookLoginBtn.setSpringAnimate()
    }
}
