//
//  ReelsPage.swift
//  umc
//
//  Created by Yujin Cha on 2022/05/10.
//

import UIKit
import SnapKit
import Then

import RxCocoa
import RxSwift

class ReelsViewController: UIViewController {
    var videoUrlStrArr:[String] = ["bird1", "bird2"]
    
    lazy var reelsCollectionView:ReelsCollectionView = {
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 1
        return ReelsCollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    }()
    private var nowPage:Int = 0
    
    var timer: Timer?
    
    func setCollectionView() {
        reelsCollectionView.delegate = self
        reelsCollectionView.dataSource = self
        
        reelsCollectionView.showsVerticalScrollIndicator = false
        
        reelsCollectionView.register(ReelsCell.classForCoder(), forCellWithReuseIdentifier: "ReelsCell")
        
        reelsCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func startLoop() {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            self.moveNextPage()
            print(self.nowPage)
        }
    }
    
    func stopLoop() {
        timer?.invalidate()
        timer = nil
    }
    
    func moveNextPage() {
        let itemCount = reelsCollectionView.numberOfItems(inSection: 0)
        nowPage += 1
        if nowPage >= itemCount {
            nowPage = 0
        }
        
        reelsCollectionView.scrollToItem(
            at: IndexPath(item: nowPage, section: 0),
            at: .centeredVertically,
            animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        
        self.view.addSubview(reelsCollectionView)
        setCollectionView()
        
    }
    
}

extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frame = self.view.safeAreaLayoutGuide.layoutFrame
        return CGSize(width: frame.width, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ReelsCell", for: indexPath) as! ReelsCell
        cell.setupUrl(urlStr: videoUrlStrArr.randomElement()!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ReelsCell {
            cell.videoView?.cleanUp()
        }
    }
}

class ReelsCollectionView: UICollectionView {

}
