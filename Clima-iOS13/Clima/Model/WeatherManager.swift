//
//  WeatherManager.swift
//  Clima
//
//  Created by FoRcE on 20/04/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager,_ weather: WeatherModel)
    func didFailWithError(_ error: Error)
}


struct WeatherManager {
    let cityURL = "https://api.openweathermap.org/geo/1.0/direct?appid=6f839ca2412a7cb992ba64c40f78e2e6"
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=6f839ca2412a7cb992ba64c40f78e2e6&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let cityUrlString = "\(cityURL)&q=\(cityName)"
        performRequest(with: cityUrlString, tipo: 1)
        
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let weatherUrlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: weatherUrlString, tipo: 2)
    }
    
    func performRequest(with urlString: String , tipo: Int){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if tipo == 1{
                    if let safeData = data {
                        self.parseCityJSON(cityData: safeData)
                    }}else{
                        if let safeData = data {
                            if let weather = self.parseWeatherJSON(weatherData: safeData){
                                self.delegate?.didUpdateWeather(self, weather)
                            }}
                    }
            }
            task.resume()
        }
    }
    
    func parseCityJSON(cityData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([CityData].self, from: cityData)
            let weatherUrlString = "\(weatherURL)&lat=\(decodedData[0].lat)&lon=\(decodedData[0].lon)"
            performRequest(with: weatherUrlString, tipo: 2)
        } catch{
    
            print(error)
        }}
    
    func parseWeatherJSON(weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let cityName = decodedData.name
            
            return WeatherModel(conditionId: id, cityName: cityName, temperature: temp)

        } catch{
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
