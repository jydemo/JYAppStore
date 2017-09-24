//
//  TodaysAppsController.swift
//  JYAppStore
//
//  Created by JYKit on 2017/9/15.
//  Copyright © 2017年 JYKit. All rights reserved.
//

import UIKit

class TodaysAppsController: DataSourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.decelerationRate = UIScrollViewDecelerationRateFast
        
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = false
            layout.minimumInteritemSpacing = 1
            layout.minimumLineSpacing = 10
        }
        
        self.datasource = TodayAppsDataSource()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FeaturedAppCardCell.self), for: indexPath) as! FeaturedAppCardCell
        //String(describing: cls.self)
        if let model = datasource?.item(indexPath) as? TodayArticle {
            if model.hasApp! && model.withBottomapp! {
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FeaturedAppCellBottomApp.self), for: indexPath) as? FeaturedAppCellBottomApp {
                    cell.bindData(todayArticle: model)
                   // cell.data = model
                    return cell
                }
            } else if model.hasApp! && !model.withBottomapp! {
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FeaturedAppCellWithBigAppIcon.self), for: indexPath) as? FeaturedAppCellWithBigAppIcon {
                    cell.bindData(todayArticle: model)
                    //cell.model = model
                    return cell
                }
            } else if model.briefDescription == "" {
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FeaturedAppTopWhiteBg.self), for: indexPath) as? FeaturedAppTopWhiteBg {
                    cell.bindData(todayArticle: model)
                    return cell
                }
            } else {
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FeaturedAppCardCell.self), for: indexPath) as? FeaturedAppCardCell {
                    cell.bindData(todayArticle: model)
                    return cell
                }
            }
        }
        return cell
    }
    //头视图的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 95)
    }
    //cell的大小
   override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 436)
    }
    
    override open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if (kind ==  UICollectionElementKindSectionHeader) {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: GeneralHeaderCell.self), for: indexPath) as! GeneralHeaderCell
            return header
        }
        return UICollectionViewCell()
    }
    func getrefreshcontrol() -> UIRefreshControl {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(handlefresn), for: .valueChanged)
        return rc
    }
    @objc func handlefresn() {}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
