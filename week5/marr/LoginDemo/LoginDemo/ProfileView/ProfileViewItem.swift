//
//  ProfileItem.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/27.
//

import Foundation
import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import RxGesture

class ProfileViewItem: UICollectionViewCell {
   
}

import SwiftUI
struct ProfileViewItemRepresentable<View: ProfileViewItem>: UIViewRepresentable {
   let view: View
   init(_ builder: @escaping () -> View) { view = builder() }
   func makeUIView(context: Context) -> UIView { return view }
   func updateUIView(_ view: UIView, context: Context) {
       view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
       view.setContentHuggingPriority(.defaultHigh, for: .vertical)
   }
}

struct ProfileViewItemPreview: PreviewProvider{
   static var previews: some View {
       ProfileViewItemRepresentable { return ProfileViewItem() }.previewLayout(.sizeThatFits)
   }
}



