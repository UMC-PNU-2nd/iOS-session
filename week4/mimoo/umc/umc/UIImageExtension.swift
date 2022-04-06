//
//  UIImageExtension.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/05.
//

import UIKit

extension UIImage {
    
    func resizeTo(size: CGSize) -> UIImage? {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    func resizeWithWidthAspectRatio(width: CGFloat) -> UIImage? {
        let ratio = self.size.width / self.size.height
        let size = CGSize(width: width, height: width / ratio)
        return resizeTo(size: size)
    }
    
    func resizeWithHeightAspectRatio(height: CGFloat) -> UIImage? {
        let ratio = self.size.width / self.size.height
        let size = CGSize(width: height * ratio, height: height)
        return resizeTo(size: size)
    }
    
    var breadth:     CGFloat { min(size.width, size.height) }
    var breadthSize: CGSize  { .init(width: breadth, height: breadth) }
    var breadthRect: CGRect  { .init(origin: .zero, size: breadthSize) }
    
    func centerCrop() -> CGImage? {
        let originX:CGFloat = size.width > size.height ? ((size.width-size.height)/2).rounded(.down) : 0.0
        let originY:CGFloat = size.height > size.width ? ((size.height-size.width)/2).rounded(.down) : 0.0
        return self.cgImage?.cropping(to: .init(origin: .init(x: originX, y: originY), size: breadthSize))
    }
    
    func circleMasked() -> UIImage? {
        guard let cgImage = centerCrop() else { return nil }
        
        let format = imageRendererFormat
        format.opaque = false
        return UIGraphicsImageRenderer(size: breadthSize, format: format)
            .image {_ in
                UIBezierPath(ovalIn: breadthRect).addClip()
                UIImage(cgImage: cgImage, scale: format.scale, orientation: imageOrientation)
                    .draw(in: .init(origin: .zero, size: breadthSize))
            }
    }
}

