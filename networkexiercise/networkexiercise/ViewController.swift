//
//  ViewController.swift
//  networkexiercise
//
//  Created by 김수민 on 2023/11/19.
//
import SnapKit
import UIKit
import Moya
class ViewController: UIViewController {
    let apiKey = "206b9ba8742999c6453ebc8907feef22"  // OpenWeatherMap에서 발급받은 API 키를 사용해야 합니다.
    let provider = MoyaProvider<WeatherAPI>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        layout()
        setAPIValue()
    }
    
    var testTextview: UITextView {
        let textView = UITextView()
        textView.frame = CGRect(x: 20, y: 100, width: 300, height: 200)
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.text = "안녕하세요, UITextView 예제입니다."
        return textView
    }
    
    var apiButton: UIButton {
        let apiButton = UIButton(type: .system) // 시스템 버튼으로 초기화
        apiButton.setTitle("버튼", for: .normal)
        apiButton.backgroundColor = .blue
        return apiButton
    }
    
    func configUI() {
        view.addSubview(testTextview)
        view.addSubview(apiButton)
    }
    
    func layout(){
        apiButton.snp.makeConstraints { make in
//            make.top.equalTo(testTextview.snp.bottom).offset(10) // 텍스트 뷰 아래로 10포인트 떨어짐
            make.centerX.equalToSuperview()
        }
        apiButton.snp.makeConstraints { make in
//            make.top.equalTo(testTextview.snp.bottom).offset(10) // 텍스트 뷰 아래로 10포인트 떨어짐
            make.centerX.equalToSuperview()
        }
    }

    

    // API 호출 예제
    func setAPIValue(){
       
        provider.request(.oneCall(lat: 37.7749, lon: -122.4194, exclude: ["current", "minutely", "hourly", "daily", "alerts"], apiKey: self.apiKey)) { result in
            switch result {
            case let .success(response):
                // API 요청이 성공한 경우 처리
                print(response)
                let result = try? response.map(weather.self)
                if let result = result?.timezone {
                    self.testTextview.text = result
                    print(result)
                }
            case let .failure(error):
                // API 요청이 실패한 경우 처리
                print(error)
            }
        }
    }

}
