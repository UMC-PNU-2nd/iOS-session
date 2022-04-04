//
//  UIImageExtension.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/05.
//

import UIKit

extension UIImage {
    
    func resizeImageTo(size: CGSize) -> UIImage? {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
}

