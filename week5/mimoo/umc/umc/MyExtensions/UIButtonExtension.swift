//
//  UIButtonExtension.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/04.
//

import UIKit

extension UIButton {
    
    func setDefaultStyle() {
        self.layer.cornerRadius = CornerRadius.middle
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.middle, weight: UIFont.Weight.bold)
        self.setSpringAnimate()
    }
    
    func setFacebookLoginStyle() {
        let facebookIcon:UIImage? = UIImage(named: "로그인/ic_login_facebook")?.resizeTo(size: IconSize.middle)
        self.setTitle("  Facebook으로 로그인", for: .normal)
        self.setTitleColor(Colors.textBtnLabelColor, for: .normal)
        self.setImage(facebookIcon, for: .normal)
        self.setImage(facebookIcon, for: .highlighted)
        self.layer.cornerRadius = CornerRadius.middle
        self.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.middle, weight: UIFont.Weight.bold)
        self.setSpringAnimate()
    }
    
    func setIconStyle(iconImage: UIImage?) {
        let img:UIImage? = iconImage?.resizeTo(size: IconSize.middle)
        self.setImage(img, for: .normal)
        self.setImage(img, for: .highlighted)
        self.setSpringAnimate()
    }
    
    func setPostProfileImageStyle(image: UIImage?) {
        let img:UIImage? = image?.circleMasked()?.resizeTo(size: ProfileImageSize.small)
        self.setImage(img, for: .normal)
        self.setImage(img, for: .highlighted)
    }
    
    func setStoryProfileImageStyle(image: UIImage?) {
        let img:UIImage? = image?.circleMasked()?.resizeTo(size: StoryCellSize.profileImage)
        self.setImage(img, for: .normal)
        self.setImage(img, for: .highlighted)
        self.imageView?.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemPink.cgColor
        self.layer.cornerRadius = StoryCellSize.profileImageBtnWidth / 2.0
        self.clipsToBounds = true
        self.setSpringAnimate()
    }
    
    func setMyProfileImageStyle(image: UIImage?) {
        let img:UIImage? = image?.circleMasked()?.resizeTo(size: ProfileImageSize.big)
        self.setImage(img, for: .normal)
        self.setImage(img, for: .highlighted)
        self.setSpringAnimate()
    }
    
    func setTwoLinesTextStyle(_ substring1: String, _ substring2: String) {
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 10
//        let attributes1 = [NSMutableAttributedString.Key.font: font1,
//                           NSAttributedString.Key.paragraphStyle: paragraphStyle]
        
        let font1: UIFont = UIFont.systemFont(ofSize: FontSize.middle, weight: .bold)
        let attributes1 = [NSMutableAttributedString.Key.font: font1]
        let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)
        
        let font2: UIFont = UIFont.systemFont(ofSize: FontSize.middle)
        let attributes2 = [NSMutableAttributedString.Key.font: font2]
        let attrString2 = NSMutableAttributedString(string: "\n" + substring2, attributes: attributes2)
        
        attrString1.append(attrString2)
        
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.numberOfLines = 2
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.setAttributedTitle(attrString1, for: [])
    }
    
    func setRoundedBorderStyle() {
        self.layer.cornerRadius = CornerRadius.small
        self.layer.borderWidth = 1
        self.layer.borderColor = Colors.dividerColor?.cgColor
        self.setSpringAnimate()
    }
    
    func setSmallTextStyle() {
        self.setTitleColor(Colors.textBtnLabelColor, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.small)
        self.setTitleColor(.blue, for: .highlighted)
        self.setSpringAnimate()
    }
        
    func setEnabled() {
        self.backgroundColor = Colors.actibatedBtnColor
        self.isEnabled = true
    }
    
    func setDisabled() {
        self.backgroundColor = Colors.disabledBtnColor
        self.isEnabled = false
    }
    
    func setSpringAnimate() {
        addTarget(self, action: #selector(springAnimateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(springAnimateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    func changeIconWithTransition(iconImage: UIImage?) {
        let img:UIImage? = iconImage?.resizeTo(size: IconSize.middle)
        UIView.transition(
            with: self,
            duration: AnimateDuration.normal,
            options: .transitionFlipFromRight,
            animations: {
                self.setImage(img, for: .normal)
                self.setImage(img, for: .highlighted)
            },
            completion: nil
        )
    }
    
    @objc private func springAnimateDown(sender: UIButton) {
        springAnimate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.98, y: 0.98))
    }
    
    @objc private func springAnimateUp(sender: UIButton) {
        springAnimate(sender, transform: .identity)
    }
    
    private func springAnimate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: AnimateDuration.normal,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 1.0,
                       options: [.curveEaseInOut],
                       animations: { button.transform = transform },
                       completion: nil
        )
    }
    
}
