//
//  CityData.swift
//  Clima
//
//  Created by FoRcE on 20/04/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct CityData: Decodable {
    let name: String
    let lat: Float
    let lon: Float
}

