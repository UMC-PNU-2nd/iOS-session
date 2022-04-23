//
//  UIWindowExtension.swift
//  umc
//
//  Created by Yujin Cha on 2022/04/06.
//

import UIKit

extension UIWindow {
    
    func replaceRootViewController(_ newRootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        let snapshotImageView = UIImageView(image: self.snapshot())
        self.addSubview(snapshotImageView)

        let replacingCompletion = {
            self.rootViewController = newRootViewController
            self.bringSubviewToFront(snapshotImageView)
            if animated == true {
                UIView.animate(
                    withDuration: AnimateDuration.normal,
                    delay: 0, options: [.curveEaseInOut],
                    animations: {
                        // snapshotImageView.alpha = 0
                        snapshotImageView.transform = CGAffineTransform(translationX: -self.bounds.size.width, y: 0)
                    }, completion: {_ in
                        snapshotImageView.removeFromSuperview()
                        completion?()
                    }
                )
            } else {
                snapshotImageView.removeFromSuperview()
                completion?()
            }
        }

        if self.rootViewController!.presentedViewController != nil {
            self.rootViewController!.dismiss(animated: true, completion: replacingCompletion)
        } else {
            replacingCompletion()
        }
    }

    func snapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: true)

        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage.init() }
        UIGraphicsEndImageContext()

        return result
    }
    
}
