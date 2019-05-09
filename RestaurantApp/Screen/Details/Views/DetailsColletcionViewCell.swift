//
//  DetailsColletcionViewCell.swift
//  RestaurantApp
//
//  Created by Buse ERKUŞ on 9.05.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import Foundation
import UIKit
class DetailsColletcionCiewCell: UICollectionViewCell{
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
            ])
        
    }
    
}
