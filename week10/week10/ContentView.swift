//
//  ContentView.swift
//  week10
//
//  Created by 박현수 on 2023/11/30.
//

import SwiftUI
import Moya
import Alamofire
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon



struct NextView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 40) {
            Text("로그인 완료").font(.title).bold()
            Text("로그아웃").font(.title).bold().padding().background(Color.green.opacity(0.3)).cornerRadius(10)
                .onTapGesture() {
                UserApi.shared.logout {(error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("logout() success.")
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    @State private var seoulTemp = 0.0
    @State private var seoulDescription = "맑음"
    @State private var busanTemp = 0.0
    @State private var busanDescription = "맑음"
    @State private var jejuTemp = 0.0
    @State private var jejuDescription = "맑음"
    @State private var isPresented = false
    
    let seoulUrl = "https://api.openweathermap.org/data/2.5/weather?appid=46bf119912a3aaa443360e604dfcaf40&units=metric&q=seoul&lang=kr"
    let busanUrl = "https://api.openweathermap.org/data/2.5/weather?appid=46bf119912a3aaa443360e604dfcaf40&units=metric&q=busan&lang=kr"
    let jejuUrl = "https://api.openweathermap.org/data/2.5/weather?appid=46bf119912a3aaa443360e604dfcaf40&units=metric&q=jeju&lang=kr"
    let apiKey = "46bf119912a3aaa443360e604dfcaf40"
    
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text("서울").font(.title).bold().padding(5).frame(maxWidth: 300)
                Text(seoulDescription)
                    .frame(maxWidth: 300)
                    .font(.title2).bold()
                    .padding(5)
                Text(String(seoulTemp)).frame(maxWidth: 300).padding(5)
            }.background(Color.gray.opacity(0.3)).cornerRadius(5).padding(5)
                .onAppear {
                    AF.request(seoulUrl,
                               method: .get,
                               parameters: nil,
                               encoding: URLEncoding.default)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let data):
                            let dictData = data as! [String: Any]
                            let mainData = dictData["main"] as! [String: Any]
                            let tempData = mainData["temp"] as! NSNumber
                            let temp = tempData.doubleValue
                            let weatherData = dictData["weather"] as! [[String: Any]]
                            let innerData = weatherData.first
                            let description = innerData?["description"] as! String
                            seoulDescription = description
                            seoulTemp = temp
                        case .failure(let error):
                            print("\(error)")
                        }
                    }
                }
            
            VStack {
                Text("부산").font(.title).bold().padding(5).frame(maxWidth: 300)
                Text(busanDescription)
                    .frame(maxWidth: 300)
                    .font(.title2).bold()
                    .padding(5)
                Text(String(busanTemp)).frame(maxWidth: 300).padding(5)
            }.background(Color.blue.opacity(0.3)).cornerRadius(5).padding()
                .onAppear {
                    AF.request(busanUrl,
                               method: .get,
                               parameters: nil,
                               encoding: URLEncoding.default)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let data):
                            let dictData = data as! [String: Any]
                            let mainData = dictData["main"] as! [String: Any]
                            let tempData = mainData["temp"] as! NSNumber
                            let temp = tempData.doubleValue
                            let weatherData = dictData["weather"] as! [[String: Any]]
                            let innerData = weatherData.first
                            let description = innerData?["description"] as! String
                            busanDescription = description
                            busanTemp = temp
                        case .failure(let error):
                            print("\(error)")
                        }
                    }
                }
            
            VStack {
                Text("제주").font(.title).bold().padding(5).frame(maxWidth: 300)
                Text(jejuDescription)
                    .frame(maxWidth: 300)
                    .font(.title2).bold()
                    .padding(5)
                Text(String(jejuTemp)).frame(maxWidth: 300).padding(5)
            }.background(Color.orange.opacity(0.3)).cornerRadius(5).padding()
                .onAppear {
                    AF.request(jejuUrl,
                               method: .get,
                               parameters: nil,
                               encoding: URLEncoding.default)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let data):
                            let dictData = data as! [String: Any]
                            let mainData = dictData["main"] as! [String: Any]
                            let tempData = mainData["temp"] as! NSNumber
                            let temp = tempData.doubleValue
                            let weatherData = dictData["weather"] as! [[String: Any]]
                            let innerData = weatherData.first
                            let description = innerData?["description"] as! String
                            jejuDescription = description
                            jejuTemp = temp
                        case .failure(let error):
                            print("\(error)")
                        }
                    }
                }
            
            Button(action: {
                UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            print("loginWithKakaoAccount() success.")
                            isPresented.toggle()
                            //do something
                            _ = oauthToken
                        }
                    }
            }) {
                Image("kakao")
            }.fullScreenCover(isPresented: $isPresented) {
                NextView()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
