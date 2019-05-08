//
//  LocationView.swift
//  RestaurantApp
//
//  Created by Buse ERKUŞ on 8.05.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit

@IBDesignable class LocationView: BaseView {

    @IBOutlet weak var allowButton: UIButton!
    @IBOutlet weak var denyButton: UIButton!
    
    var didTapAllow:(() ->Void)?
    
 
    @IBAction func allowAction(_ sender: Any) {
        didTapAllow?()

    }
    
    @IBAction func denyAction(_ sender: Any) {
//        print("tap tap")
    }
    
}
