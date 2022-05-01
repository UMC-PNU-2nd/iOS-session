//
//  UIViewController.swift
//  CatStarGram
//
//  Created by 정지윤 on 2022/03/29.
//

import Foundation
import UIKit

extension UIViewController{
    func generateButtonAttribute(_ button: UIButton,
                                 // ...은 파라미터를 복수로 받을 수 있는 swift 문법
                                 texts: String...,
                                 fonts: UIFont...,
                                 colors: UIColor...) -> NSMutableAttributedString { //어떤 속성이 적용된 형태로 리턴한다
        
        //UIButton에 입력된 text를 가져온다
        guard let wholeText = button.titleLabel?.text else {fatalError("버튼에 텍스트가 없음.")}
        
        // 폰트들
        let customFonts: [UIFont] = fonts
        
        //설정하고자 하는 String의 NSRanges
        let customTextsRanges = texts.indices.map { index in
            (wholeText as NSString).range(of: texts[index])
        }
        
        //설정하고자 하는 색상들
        let customColors = colors
        
        // attribute 객체를 생성한다
        let attributedString = NSMutableAttributedString(string: wholeText)
        
        //텍스트에 맞는 설정을 추가한다
        texts.indices.forEach{index in
            attributedString.addAttribute(.font,
                                          value: customFonts[index],
                                          range: customTextsRanges[index])
            
            attributedString.addAttribute(.foregroundColor,
                                          value: customColors[index],
                                          range: customTextsRanges[index])
            
        }
        return attributedString
    }
}
