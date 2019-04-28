//
//  ArticleCollectionViewCell.swift
//  DeOfHet
//
//  Created by Prajakta Kulkarni on 15/03/2019.
//  Copyright © 2019 Prajakta Kulkarni. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    enum type : String{
        case empty
        case title
        case value
    }
    @IBOutlet private var label:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup(aType:type, value:String){
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.gray.cgColor
        switch aType {
        case .empty:
            label.isHidden = true
            return
        case .title:
            label.textColor = UIColor.init(red: 0.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            break
        case .value:
            break
        }
        label.text = value
    }
}
