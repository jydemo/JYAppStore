//
//  featuredAppCardCell.swift
//  JYAppStore
//
//  Created by JYKit on 2017/9/17.
//  Copyright © 2017年 JYKit. All rights reserved.
//

import UIKit

class FeaturedAppCardCell: DataSourceCell {

    var model: TodayArticle? {
        didSet {
            if let model = model {
                imageBg.image = UIImage(named: model.photo ?? "xx")
                smallTitle.text = model.smallTitle
                bigTitle.text = model.bigTitle
                smalldscription.text = model.briefDescription
            }
        }
    }
    
    func bindData(todayArticle: TodayArticle) {
        imageBg.image = UIImage(named: (todayArticle.photo)!)
        smallTitle.text = todayArticle.smallTitle
        bigTitle.text = todayArticle.bigTitle
        smalldscription.text = todayArticle.briefDescription
    }
    
    private lazy var cardview: CardView = {
        let cv = CardView()
        cv.cornerRadius = 20
        return cv
    }()
     lazy var imageBg: UIImageView = {
        let imageBG = UIImageView()
        imageBG.image = #imageLiteral(resourceName: "good_living")
        //在参考的代码里是.scaleAspectFit，运行在不同分辨率的iPhone上会出现效果不一致的情况，设置成scaleAspectFill就完美解决
        imageBG.contentMode = .scaleAspectFill
        return imageBG
    }()
     lazy var smallTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "SMALLTitle".uppercased()
        return label
    }()
    lazy var bigTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 0
        label.text = "The Beauty of modern Living by bigTitle"
        return label
    }()
     lazy var smalldscription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "Pimp up your home with the best design classics and smart helpers by smalldscription"
        return label
    }()
    override func setupViews() {
        super.setupViews()
        layoutViews()
    }
    private func layoutViews() {
        addSubview(cardview)
        addSubview(imageBg)
        addSubview(smallTitle)
        addSubview(bigTitle)
        addSubview(smalldscription)
        
        cardview.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 8, rightcontant: 16, widthConstant: 0, heightConstant: 0)
        
        imageBg.anchor(cardview.topAnchor, left: cardview.leftAnchor, bottom: cardview.bottomAnchor, right: cardview.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightcontant: 0, widthConstant: 0, heightConstant: 0)
        
        smallTitle.anchor(imageBg.topAnchor, left: imageBg.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightcontant: 0, widthConstant: 0, heightConstant: 0)
        
        bigTitle.anchor(smallTitle.bottomAnchor, left: smallTitle.leftAnchor, bottom: nil, right: imageBg.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightcontant: 120, widthConstant: 0, heightConstant: 0)
        
        smalldscription.anchor(nil, left: smallTitle.leftAnchor, bottom: bottomAnchor, right: imageBg.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 16, rightcontant: 16, widthConstant: 0, heightConstant: 0)
    }

}
