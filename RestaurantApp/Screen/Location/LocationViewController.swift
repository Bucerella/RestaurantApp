//
//  LocationViewController.swift
//  RestaurantApp
//
//  Created by Buse ERKUŞ on 8.05.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit


class LocationViewController: UIViewController {
    
    @IBOutlet weak var locationView: LocationView!
    var locationService: LocationService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationView?.didTapAllow = { [weak self] in
            self?.locationService?.requestLocationAuthorization()
            print("Tapp")
        }
        
        locationService?.didChangeStatus = { [weak self] success in
            if success {
                self?.locationService?.getLocation()
            }
        }
        
        locationService?.newLocation = { [weak self] result in
            switch result {
            case .success(let location):
                print(location)
            case .failure(let error):
                assertionFailure("Error getting the users location \(error)")
            }
        }
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
