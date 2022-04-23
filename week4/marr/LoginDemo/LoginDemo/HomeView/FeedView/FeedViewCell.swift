 //
//  FeedCell.swift
//  LoginDemo
//
//  Created by Lee Jun Young on 2022/04/06.
//

import Foundation
import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift
import RxGesture

class FeedViewCell: UITableViewCell {
    let disposeBag = DisposeBag()
    let feedViewModel = FeedViewModel()
    
    var userIconView = UIImageView().then {
        $0.image = UIImage(systemName: "person.circle")
        $0.tintColor = UIColor.gray
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var usernameView = UILabel().then {
        $0.text = "Lorem Ipsum"
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    }
    var feedImageView = UIImageView().then {
        $0.image = UIImage(named: "feed")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
    }
    
    var menuIconView = UIImageView().then {
        $0.image = UIImage(systemName: "line.3.horizontal")
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .black
        $0.isUserInteractionEnabled = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    var heartIconView = UIImageView().then {
        $0.image = UIImage(named: "ic_home_heart_full")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    var commentIconView = UIImageView().then {
        $0.image = UIImage(named: "ic_home_comment")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    var dmIconView = UIImageView().then {
        $0.image = UIImage(named: "ic_home_send")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    var bookMarkIconView = UIImageView().then {
        $0.image = UIImage(named: "ic_bookmark_white")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell() {
        contentView.snp.makeConstraints { $0.height.equalTo(contentHeight) }
        setHeader()
        setFeedImage()
        setFooter()
        setBindings()
    }
    
    func setBindings() {
        feedViewModel.isLike.bind {
            if $0 == false {
                self.heartIconView.image = UIImage(named: "ic_home_heart")
            } else {
                self.heartIconView.image = UIImage(named: "ic_home_heart_full")
            }
        }.disposed(by: disposeBag)
    }
    
    func setFooter() {
        setHeartIcon()
        setCommentIcon()
        setDmIcon()
        setBookmarkIcon()
    }
    
    func setHeader() {
        setUserIcon()
        setUsername()
        setMenuIcon()
    }
    
    func setBookmarkIcon() {
        self.addSubview(bookMarkIconView)
        bookMarkIconView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(footerRatio)
            $0.width.equalToSuperview().multipliedBy(footerRatio * 0.9)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalTo(feedImageView.snp.bottom)
        }
    }
    
    func setDmIcon() {
        self.addSubview(dmIconView)
        dmIconView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(footerRatio)
            $0.width.equalToSuperview().multipliedBy(footerRatio * 0.9)
            $0.left.equalTo(commentIconView.snp.right).offset(10)
            $0.top.equalTo(feedImageView.snp.bottom)
        }
    }
    
    func setCommentIcon() {
        self.addSubview(commentIconView)
        commentIconView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(footerRatio)
            $0.width.equalToSuperview().multipliedBy(footerRatio)
            $0.left.equalTo(heartIconView.snp.right).offset(10)
            $0.top.equalTo(feedImageView.snp.bottom)
        }
    }
    
    func setHeartIcon() {
        self.addSubview(heartIconView)
        heartIconView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(footerRatio)
            $0.width.equalToSuperview().multipliedBy(footerRatio)
            $0.left.equalToSuperview().offset(10)
            $0.top.equalTo(feedImageView.snp.bottom)
        }
        
        heartIconView.rx.tapGesture().map { _ in
            let isLike = !(self.feedViewModel.likeSubject.value ?? false)
            return isLike
        }
        .bind(to: feedViewModel.likeSubject)
        .disposed(by: disposeBag)
    }
    
    func setMenuIcon() {
        self.addSubview(menuIconView)
        menuIconView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(headerRatio)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalToSuperview()
            $0.centerY.equalTo(userIconView)
        }
    }
    
    func setUserIcon() {
        self.addSubview(userIconView)
        userIconView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(headerRatio)
            $0.width.equalToSuperview().multipliedBy(headerRatio)
            $0.left.equalToSuperview().offset(10)
            $0.top.equalToSuperview()
        }
    }
    
    func setUsername() {
        self.addSubview(usernameView)
        usernameView.snp.makeConstraints {
            $0.left.equalTo(userIconView.snp.right).offset(10)
            $0.centerY.equalTo(userIconView)
            $0.centerY.equalTo(userIconView)
        }
    }
    
    func setFeedImage() {
        self.addSubview(feedImageView)
        feedImageView.snp.makeConstraints {
            $0.left.equalTo(self.snp.left)
            $0.top.equalTo(userIconView.snp.bottom).offset(0)
            $0.width.equalTo(self.snp.width)
            $0.height.equalTo(contentView).multipliedBy(0.8)
        }
    }
}

extension FeedViewCell {
    var contentHeight: Int { return 500 }
    var headerRatio: Float { return (1 - feedImageRatio) / 2 }
    var footerRatio: Float { return headerRatio }
    var feedImageRatio: Float { return 0.85 }
}

import SwiftUI
struct FeedViewCellRepresentable<View: FeedViewCell>: UIViewRepresentable {
    let view: View
    init(_ builder: @escaping () -> View) { view = builder() }
    func makeUIView(context: Context) -> UIView { return view }
    func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

struct FeedViewCellPreview: PreviewProvider{
    static var previews: some View {
        FeedViewCellRepresentable { return FeedViewCell() }.previewLayout(.sizeThatFits)
    }
}


