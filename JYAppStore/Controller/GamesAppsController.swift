//
//  GamesAppsController.swift
//  JYAppStore
//
//  Created by JYKit on 2017/9/15.
//  Copyright © 2017年 JYKit. All rights reserved.
//

import UIKit

class GamesAppsController: UIViewController {
    let cellID = "cell"
    var config: ViewControllerConfigurator? {
        didSet {
            if let config = config {
                if let apps = config.appsArray {
                    self.apps = apps
                }
                if let itemsArray = config.listArray {
                    self.items = itemsArray
                }
                if let header = config.headerItem {
                    self.headerItem = header
                }
                if let subheader = config.subHeaderTitle {
                    self.subHeaderTitle = subheader
                }
            }
            self.collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = SnappingCollectionViewLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = false
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.decelerationRate = UIScrollViewDecelerationRateFast
        cv.showsHorizontalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.register(LargePhotoHorizontionCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: LargePhotoHorizontionCollectionViewCell.self))
        cv.register(SmallListHolderCell.self, forCellWithReuseIdentifier: String(describing: SmallListHolderCell.self))
        return cv
    }()
    
    private var items = [String]()
    private var apps: [App]?
    private var headerItem: HeaderItem?
    private var  subHeaderTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(collectionView)
        collectionView.fillsuperview()
        //collectionView.register(LargePhotoHorizontionCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: LargePhotoHorizontionCollectionViewCell.self))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GamesAppsController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.section != 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SmallListHolderCell.self), for: indexPath) as! SmallListHolderCell
            cell.model = apps
            return cell
        } else {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LargePhotoHorizontionCollectionViewCell.self), for: indexPath) as! LargePhotoHorizontionCollectionViewCell
            print(apps.debugDescription)
            cell.appData = apps
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if(indexPath.section == 0){
                return CGSize(width: view.frame.width, height: 318)
            }
        return CGSize(width: view.frame.width, height: 85)
    }
}
