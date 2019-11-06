//
//  Main2ViewController.swift
//  SOPT_week2_exercise3
//
//  Created by 윤동민 on 2019/11/06.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit
import CHIPageControl

class MainViewController: UIViewController {
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var paging: CHIPageControlAleppo!
    private var banners: [Banner] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBanner()
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
    }
    
    private func setBanner() {
        let banner1 = Banner(bannerName: "mainImage")
        let banner2 = Banner(bannerName: "mainImage02")
        let banner3 = Banner(bannerName: "mainImage03")
        banners = [banner1, banner2, banner3]
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as? TempCell else { return UICollectionViewCell() }
        cell.bannerImage.image = banners[indexPath.row].bannerImage
        cell.bannerImage.contentMode = .scaleToFill
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

extension MainViewController: UICollectionViewDelegate {
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        print(currentPage)
        self.paging.set(progress: currentPage, animated: true)
    }
}
