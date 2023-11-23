//
//  weather.swift
//  networkexiercise
//
//  Created by 김수민 on 2023/11/19.
//

import Foundation

struct weather: Decodable {
    var lat: Double
    var lon: Double
    var timezone: String
    var timezone_offset: Int
}

