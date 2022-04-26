//
//  WeatherData.swift
//  Clima
//
//  Created by FoRcE on 20/04/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct Coord: Codable{
    let lon: Float
    let lat: Float
}

struct WeatherData: Codable{
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Weather: Codable{
    let id: Int
    let main: String
    let description: String
}

struct Main: Codable {
    let temp: Double
}
