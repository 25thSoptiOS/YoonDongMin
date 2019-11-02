//
//  MainViewController.swift
//  SOPT_week2_exercise3
//
//  Created by 윤동민 on 2019/10/26.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit
import CHIPageControl

class MainViewController: UIViewController {
    @IBOutlet weak var banncerCV: UICollectionView!
    @IBOutlet weak var paging: CHIPageControlAleppo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBanner()
        banncerCV.delegate = self
        banncerCV.dataSource = self
    }
    
    private func setBanner() {
        let banner1 = Banner(bannerName: "mainImage")
        let banner2 = Banner(bannerName: "mainImage01")
        let banner3 = Banner(bannerName: "mainImage02")
          
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.bannerList = [banner1, banner2, banner3]
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return 0 }
        return delegate.bannerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return UICollectionViewCell() }
        
        let banner = delegate.bannerList[indexPath.row]
        bannerCell.banner?.image = banner.bannerImage
        return bannerCell
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        print(currentPage)
        self.paging.set(progress: currentPage, animated: true)
    }
}

