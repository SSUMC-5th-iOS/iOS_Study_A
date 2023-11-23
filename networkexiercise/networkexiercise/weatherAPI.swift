//
//  weatherAPI.swift
//  networkexiercise
//
//  Created by 김수민 on 2023/11/19.
//

import Foundation
import Moya

enum WeatherAPI {
    case oneCall(lat: Double, lon: Double, exclude: [String], apiKey: String)
}

extension WeatherAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.org/data/3.0")!
    }

    var path: String {
        switch self {
        case .oneCall:
            return "/onecall"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case let .oneCall(lat, lon, exclude, apiKey):
            return .requestParameters(parameters: ["lat": lat, "lon": lon, "exclude": exclude, "appid": apiKey], encoding: URLEncoding.default)
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
