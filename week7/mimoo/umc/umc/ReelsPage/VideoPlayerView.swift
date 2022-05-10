//
//  VideoPlayerView.swift
//  umc
//
//  Created by Yujin Cha on 2022/05/10.
//

import UIKit
import AVKit

class VideoPlayerView: UIView {
    
    var playerLayer: AVPlayerLayer?
    var playerLooper: AVPlayerLooper?
    var queuePlayer: AVQueuePlayer?
    
    init(frame: CGRect, urlStr: String) {
        super.init(frame: frame)
        
        let videoFileUrl = Bundle.main.url(forResource: urlStr, withExtension: "mp4")!
        let playerItem = AVPlayerItem(url: videoFileUrl)
        
        self.queuePlayer = AVQueuePlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer()
        
        playerLayer!.player = queuePlayer
        playerLayer!.videoGravity = .resizeAspectFill
        
        self.layer.addSublayer(playerLayer!)
        
        playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playerItem)
        queuePlayer!.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("should not be in storyboard")
    }
 
    public func cleanUp() {
        queuePlayer?.pause()
        queuePlayer?.removeAllItems()
        queuePlayer = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer!.frame = bounds
    }
}
