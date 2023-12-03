//
//  ViewController.swift
//  iOS_Study_A
//
//  Created by 박지윤 on 2023/09/28.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController {
    
    let apiKey = "a28bbefa78d1e59447d3ad92aeac5475"
    let url = "https://api.openweathermap.org/data/2.5/weather"
    
    //    let munchenAPI = "https://api.openweathermap.org/data/2.5/weather?q=München&appid=a28bbefa78d1e59447d3ad92aeac5475"
    //
    //    let londonAPI = "https://api.openweathermap.org/data/2.5/weather?q=London&appid=a28bbefa78d1e59447d3ad92aeac5475"
    //
    //    let parisAPI = "https://api.openweathermap.org/data/2.5/weather?q=Paris&appid=a28bbefa78d1e59447d3ad92aeac5475"
    
    struct WeatherData: Codable {
        let weather: [Weather]
        let main: Main
        let name: String
    }
    
    struct Main: Codable {
        let temp: Double
    }
    
    struct Weather: Codable {
        let id: Int
    }
    
    let munchenView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 10
        return view
    }()
    
    let munchenLabel: UILabel = {
        let label = UILabel()
        label.font.withSize(30)
        return label
    }()
    
    let munchenWeather: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let munchenTemp: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let munchenHum: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let londonView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        return view
    }()
    
    let londonLabel: UILabel = {
        let label = UILabel()
        label.font.withSize(30)
        return label
    }()
    
    let londonWeather: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let londonTemp: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let londonHum: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let parisView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        view.layer.cornerRadius = 10
        return view
    }()
    
    let parisLabel: UILabel = {
        let label = UILabel()
        label.font.withSize(30)
        return label
    }()
    
    let parisweather: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let parisTemp: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let parisHum: UILabel = {
        let label = UILabel()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        weatherDataLoad(city: "München")
        weatherDataLoad(city: "London")
        weatherDataLoad(city: "Paris")
        
        configureSubviews()
        makeConstraints()

        // Do any additional setup after loading the view.
    }
    
    func weatherDataLoad(city: String) {
        var label = UILabel()
        var weather = UILabel()
        var temp = UILabel()
        var hum = UILabel()
        
        let params = ["q":city, "appid":apiKey]
        
        if(city == "München") {
            label = munchenLabel
            weather = munchenWeather
            temp = munchenTemp
            hum = munchenHum
        }
        else if(city == "London") {
            label = londonLabel
            weather = londonWeather
            temp = londonTemp
            hum = londonHum
        } else if(city == "Paris") {
            label = parisLabel
            weather = parisweather
            temp = parisTemp
            hum = parisHum
        }
        
        AF.request(url,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding.default)
        .responseJSON { response in
            switch response.result {
            case .success(let data):
                let dictData = data as! [String: Any]
                let name = dictData["name"] as! String
                
                let mainData = dictData["main"] as! [String: Any]
                let tempData = mainData["temp"] as! NSNumber
                let tempD = tempData.floatValue
                let humData = mainData["humidity"] as! NSNumber
                let humD = humData.intValue
                
                let weatherData = dictData["weather"] as! [[String: Any]]
                let innerData = weatherData.first
                let description = innerData?["description"] as! String
                
                label.text = name
                temp.text = "Temperature : " + String(tempD)
                hum.text = "Humidity : " + String(humD)
                weather.text = "Now : " + description
                
                break
            case .failure(let error):
                print("\(error)")
                break
            }
        }
    }
    
    func configureSubviews() {
        
        view.addSubview(munchenView)
        view.addSubview(londonView)
        view.addSubview(parisView)
        
        munchenView.addSubview(munchenLabel)
        munchenView.addSubview(munchenWeather)
        munchenView.addSubview(munchenTemp)
        munchenView.addSubview(munchenHum)
        
        londonView.addSubview(londonLabel)
        londonView.addSubview(londonWeather)
        londonView.addSubview(londonTemp)
        londonView.addSubview(londonHum)
        
        parisView.addSubview(parisLabel)
        parisView.addSubview(parisweather)
        parisView.addSubview(parisTemp)
        parisView.addSubview(parisHum)
        
    }
    
    func makeConstraints() {
        munchenView.snp.makeConstraints() { make in
            make.width.equalTo(300)
            make.height.equalTo(180)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
        
        munchenLabel.snp.makeConstraints() {make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
        }
        
        munchenWeather.snp.makeConstraints() { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(munchenLabel.snp.bottom).offset(20)
        }
        
        munchenTemp.snp.makeConstraints() { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(munchenWeather.snp.bottom).offset(10)
        }
        
        munchenHum.snp.makeConstraints() { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(munchenTemp.snp.bottom).offset(10)
        }
        
        londonView.snp.makeConstraints() { make in
            make.width.equalTo(300)
            make.height.equalTo(180)
            make.centerX.equalToSuperview()
            make.top.equalTo(munchenView.snp.bottom).offset(30)
        }
        
        londonLabel.snp.makeConstraints() {make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
        }
        
        londonWeather.snp.makeConstraints() { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(londonLabel.snp.bottom).offset(20)
        }
        
        londonTemp.snp.makeConstraints() { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(londonWeather.snp.bottom).offset(10)
        }
        
        londonHum.snp.makeConstraints() { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(londonTemp.snp.bottom).offset(10)
        }
        
        parisView.snp.makeConstraints() { make in
            make.width.equalTo(300)
            make.height.equalTo(180)
            make.centerX.equalToSuperview()
            make.top.equalTo(londonView.snp.bottom).offset(30)
        }
        
        parisLabel.snp.makeConstraints() {make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
        }
        
        parisweather.snp.makeConstraints() { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(parisLabel.snp.bottom).offset(20)
        }
        
        parisTemp.snp.makeConstraints() { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(parisweather.snp.bottom).offset(10)
        }
        
        parisHum.snp.makeConstraints() { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(parisTemp.snp.bottom).offset(10)
        }
        
    }


}

