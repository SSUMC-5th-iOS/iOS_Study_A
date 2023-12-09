//
//  WeatherAPIView.swift
//  SixthWorkbook
//
//  Created by 김수민 on 2023/12/09.
//

import SwiftUI
import Moya

struct WeatherAPIView: View {
    let apiKey = "206b9ba8742999c6453ebc8907feef22"
    let provider = MoyaProvider<WeatherAPI>()
    
    @State private var apiResult: String = "안녕하세요"
    
    var body: some View {
        VStack {
            Text(apiResult)
                .font(.system(size: 16))
                .padding()
            
            Button(action: setAPIValue) {
                Text("API 호출")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
            }
            .padding()
        }
        
    }
    
    // API 호출 예제
    func setAPIValue() {
        provider.request(.oneCall(lat: 37.7749, lon: -122.4194, exclude: ["current", "minutely", "hourly", "daily", "alerts"], apiKey: self.apiKey)) { result in
            switch result {
            case let .success(response):
                // API 요청이 성공한 경우 처리
                print(response)
                let result = try? response.map(weather.self)
                if let result = result?.timezone {
                    self.apiResult = result
                    print(result)
                }
            case let .failure(error):
                // API 요청이 실패한 경우 처리
                print(error)
            }
        }
    }
}

struct WeatherAPIView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherAPIView()
    }
}
