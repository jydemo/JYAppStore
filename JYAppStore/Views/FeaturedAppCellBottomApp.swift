//
//  FeaturedAppCellBottomApp.swift
//  JYAppStore
//
//  Created by JYKit on 2017/9/21.
//  Copyright © 2017年 JYKit. All rights reserved.
//

import UIKit

class FeaturedAppCellBottomApp: FeaturedAppCellWithBigAppIcon {
    var data: TodayArticle? {
        didSet {
            if let model = model {
                if let app = model.app{
                    //appImage.image = UIImage(named: app.appPhoto!)
                    appDetails.attributedText = getAtributedStringForDesc(app: app)
                    bigTitle.text = model.bigTitle
                    imageBg.image = UIImage(named: model.photo ?? "xx")
                    smallTitle.text = model.smallTitle
                    bigTitle.text = model.bigTitle
                    smalldscription.text = model.briefDescription
                }
            }
        }
    }
    
    lazy var whiteBG: UIView = {
        let whiteBG = UIView()
        whiteBG.layer.cornerRadius = 12
        whiteBG.backgroundColor = .white
        return whiteBG
    }()
    lazy var whiteBGCornerErase: UIView = {
        let  whiteBG = UIView()
        whiteBG.backgroundColor = .white
        return whiteBG
    }()
    
    override func bindData(todayArticle: TodayArticle) {
        super.bindData(todayArticle: todayArticle)
    }
    //这里使用FeaturedAppCardCell的setupViews，在FeaturedAppCellWithBigAppIcon使用的是layoutSubviews，这里再使用setupViews就会出现问题了，layoutSubviews会在setupViews之后执行，在setupViews中设置视图，会被FeaturedAppCellWithBigAppIcon中layoutSubviews方法中重新设置了视图，在setupViews设置等视图就失效了。
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        smallTitle.isHidden = false
        
        bigTitle.removeFromSuperview()
        appImage.removeFromSuperview()
        appDetails.removeFromSuperview()
        getBtn.removeFromSuperview()
        
        imageBg.addSubview(whiteBGCornerErase)
        imageBg.addSubview(whiteBG)
        
        whiteBG.addSubview(bigTitle)
        whiteBG.addSubview(appImage)
        whiteBG.addSubview(appDetails)
        whiteBG.addSubview(getBtn)
        
        whiteBG.anchor(nil, left: imageBg.leftAnchor, bottom: imageBg.bottomAnchor, right: imageBg.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightcontant: 0, widthConstant: 0, heightConstant: 60)
        
        whiteBGCornerErase.anchor(whiteBG.topAnchor, left: imageBg.leftAnchor, bottom: nil, right: imageBg.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightcontant: 0, widthConstant: 0, heightConstant: 30)
        
        appImage.anchor(whiteBG.topAnchor, left: whiteBG.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 16, bottomConstant: 0, rightcontant: 0, widthConstant: 40, heightConstant: 40)
        
        bigTitle.anchor(smallTitle.bottomAnchor, left: smallTitle.leftAnchor, bottom: nil, right: imageBg.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightcontant: 120, widthConstant: 0, heightConstant: 0)
        
        appDetails.anchor(appImage.topAnchor, left: appImage.rightAnchor, bottom: nil, right: getBtn.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightcontant: 16, widthConstant: 0, heightConstant: 0)
        
        getBtn.anchor(appDetails.topAnchor, left: nil, bottom: nil, right: whiteBG.rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightcontant: 16, widthConstant: 50, heightConstant: 0)
        
        imageBg.contentMode = .scaleAspectFill
        imageBg.layer.cornerRadius = 20
        imageBg.clipsToBounds = true
        
        bigTitle.textColor = .white
        smallTitle.textColor = .white
    }
}
