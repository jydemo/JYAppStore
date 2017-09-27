//
//  LargePhotoHorizontionCollectionViewCell.swift
//  JYAppStore
//
//  Created by JYKit on 2017/9/26.
//  Copyright © 2017年 JYKit. All rights reserved.
//

import UIKit

class LargePhotoHorizontionCollectionViewCell: DataSourceCell {
    lazy var collectionView: UICollectionView = {
        let layout = SnappingCollectionViewLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.decelerationRate = UIScrollViewDecelerationRateFast
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.register(HorizontalBigAppCell.self, forCellWithReuseIdentifier: String(describing: HorizontalBigAppCell.self))
        return cv
    }()
    var appData: [App]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    override func setupViews() {
        addSubview(collectionView)
        self.backgroundColor = .white
        collectionView.fillsuperview()
       
    }
}
extension LargePhotoHorizontionCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appData?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HorizontalBigAppCell.self), for: indexPath) as! HorizontalBigAppCell
        cell.app = appData?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width - 32, height: 318)
    }
}
