//
//  HorizontalBigAppCell.swift
//  JYAppStore
//
//  Created by JYKit on 2017/9/26.
//  Copyright © 2017年 JYKit. All rights reserved.
//

import UIKit

class HorizontalBigAppCell: DataSourceCell {
    var app: App? {
        didSet {
            if let app = app {
                smallTitle.attributedText = getAttributedStringForHeading(app: app)
                imageBg.image = UIImage(named: app.appPhoto!)
            }
        }
    }
    
    private func getAttributedStringForHeading(app: App) -> NSAttributedString {
        let headerBlue = UIColor(red: 136 / 255, green: 190 / 255, blue: 249 / 255, alpha: 1)
        let lightGray = UIColor(red: 142 / 255, green: 142 / 255, blue: 147 / 255, alpha: 1)
        let paragraphStyle = NSMutableParagraphStyle()
        
        let attributedString = NSMutableAttributedString(string: "\(app.appcategory!)\n", attributes: [.font: UIFont.systemFont(ofSize: 9), .foregroundColor: headerBlue])
        attributedString.append(NSAttributedString(string: "\(app.appName!)\n", attributes: [.font : UIFont.systemFont(ofSize: 20), .foregroundColor: UIColor.black]))
        attributedString.append(NSAttributedString(string: "\(app.appDesc!)", attributes: [.font : UIFont.systemFont(ofSize: 20), .foregroundColor: lightGray]))
        let  rnage = NSMakeRange(0, attributedString.string.count)
        attributedString.addAttributes([.paragraphStyle : paragraphStyle], range: rnage)
        return attributedString
    }
    
    lazy var smallTitle: UITextView = {
        let label = UITextView()
        return label
    }()
    lazy var imageBg: UIImageView = {
        let imgBg = UIImageView()
        imgBg.contentMode = .scaleAspectFill
        imgBg.clipsToBounds = true
        imgBg.layer.cornerRadius = 12
        imgBg.layer.masksToBounds = true
        imgBg.backgroundColor = .blue
        return imgBg
    }()
    override func setupViews() {
        super.setupViews()
        layoutViews()
    }
    private func layoutViews() {
        addSubview(imageBg)
        addSubview(smallTitle)
        smallTitle.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightcontant: 0, widthConstant: 0, heightConstant: 0)
        imageBg.anchor(smallTitle.bottomAnchor, left: smallTitle.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 16, rightcontant: 0, widthConstant: 0, heightConstant: 0)
    }
}
