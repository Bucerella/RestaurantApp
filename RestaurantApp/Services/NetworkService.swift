//
//  NetworkService.swift
//  RestaurantApp
//
//  Created by Buse ERKUŞ on 9.05.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import Foundation
import Moya

private let apiKey = "tfphGG1XiTx3PNeLbE2O9dOtrQ6kcfLfCI6zs1sDMMwWZdhWo5BgY-zwrBtfkNaKg87gA1rklDFigygcP2Mf3Ek_2egVv7nbllnYj60WfPZQFSbntYOSodRzLevTXHYx"

enum YelpService{
    enum BusinessesProvider: TargetType {
        case search(lat: Double, long: Double)
        case details(id: String)

        
        var baseURL: URL{
            return URL(string:"https://api.yelp.com/v3/businesses")!
        }
        var path: String{
            switch self {
            case .search:
                return "/search"
            case let .details(id):
                return "/\(id)"
            }
        }
        var method: Moya.Method{
            return .get
        }
        var sampleData: Data{
            return Data()
        }
        var task: Task{
            switch self {
            case let .search(lat, long):
                return .requestParameters(parameters: ["latitude": lat, "longitude": long, "limit":10], encoding: URLEncoding.queryString)
            case .details:
                return .requestPlain
             }
        }
        var headers: [String : String]?{
            return ["Authorization": "Bearer \(apiKey)"]
        }
    }
}
