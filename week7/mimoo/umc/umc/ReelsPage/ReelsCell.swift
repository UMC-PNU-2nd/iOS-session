//
//  ReelsCell.swift
//  umc
//
//  Created by Yujin Cha on 2022/05/10.
//

import UIKit
import SnapKit
import AVKit

class ReelsCell:UICollectionViewCell {

    var videoView: VideoPlayerView?
    
    lazy var titleLabel = UILabel()
    lazy var cameraBtn = UIButton()
    lazy var heartBtn = UIButton()
    lazy var commentBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("should not be in storyboard")
    }
    
    func setupUrl(urlStr: String) {
        self.videoView = VideoPlayerView(frame: .zero, urlStr: urlStr)
        setupLayout()
    }
    
    
    var isHeart:Bool = false
    @objc internal func clickHeart(_ sender: Any) {
        heartBtn.changeIconWithTransition(iconImage: UIImage(named: isHeart ? "홈/ic_home_heart" : "홈/ic_home_heart_full"))
        isHeart = !isHeart
    }
    func setPostBtns() {
        heartBtn.setIconStyle(iconImage: UIImage(named: "홈/ic_home_heart"))
        heartBtn.addTarget(self, action: #selector(clickHeart(_:)), for: .touchUpInside)
        commentBtn.setIconStyle(iconImage: UIImage(named: "홈/ic_home_comment"))
        cameraBtn.setIconStyle(iconImage: UIImage(systemName: "camera"))
    }
    
    func setupLayout() {
        guard let videoView = videoView else { return }
        contentView.addSubview(videoView)
        
        videoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        [titleLabel, cameraBtn, heartBtn, commentBtn].forEach { contentView.addSubview($0) }
        
        titleLabel.then {
            $0.text = "릴스"
            $0.font = .boldSystemFont(ofSize: 25)
            $0.textAlignment = .left
        }.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        setPostBtns()
        cameraBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        commentBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-50)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        heartBtn.snp.makeConstraints {
            $0.bottom.equalTo(commentBtn).offset(-50)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
}
