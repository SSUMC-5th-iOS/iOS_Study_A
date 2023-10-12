//
//  FirstView.swift
//  test
//
//  Created by 김수민 on 2023/10/11.
//

import UIKit
import SnapKit

class FirstView: BaseView {
    
    // MARK: - property
    let pizzaImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        let image = UIImage(named: "pizza")
        imageView.image = image
        return imageView
    }()

    let stackView: UIStackView = {
        // 세 개의 텍스트 뷰 생성
        let text1 = UILabel()
        text1.text = "<인기> [재주문 1위] 바싹불고기피자"
        text1.font = UIFont.boldSystemFont(ofSize: 20) // 크기 20으로 설정
        let text2 = UILabel()
        text2.text = "바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가 제빵 선명희피자의 야심작"
        text2.numberOfLines = 0 // 텍스트 줄바꿈을 활성화
        let text3 = UILabel()
        text3.text = "영양 성분 및 알레르기성분 표기"
        let stackView = UIStackView(arrangedSubviews: [text1, text2, text3])
        stackView.axis = .vertical
        stackView.spacing = 5
        // 패딩 설정
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    let firstDividerView: DividerView = {
        var divider = DividerView()
        divider.snp.makeConstraints {
            $0.height.equalTo(10)
        }
        return divider
    }()
    
    let secondDividerView: DividerView = {
        var divider = DividerView()
        divider.snp.makeConstraints {
            $0.height.equalTo(10)
        }
        return divider
    }()
    // HStack 생성
    
//    let checkingButton: UIButton = {
//            var buttonStatus: Bool = false
//            let button = UIButton()
//            button.setTitle("버튼", for: .normal)
//            button.backgroundColor = .gray // 버튼 배경색을 설정
//            // 클릭 이벤트 핸들러 추가
//            button.addTarget(self, action: #selector(checking), for: .touchUpInside)
//            return button
//    }()

    var buttonStatus: Bool = false
    @objc func checking(){
        buttonStatus = true
    }
    let sizeMStackView: UIStackView = {
//        firstCheckingButton
        let text1 = UILabel()
        text1.text = "M"
        let text2 = UILabel()
        text2.text = "20,000원"
        text2.textAlignment = .right
        let checkingButton: UIButton = {
//            var buttonStatus: Bool = false
            let button = UIButton()
            button.setTitle("버튼", for: .normal)
            button.backgroundColor = .gray // 버튼 배경색을 설정
            // 클릭 이벤트 핸들러 추가
            button.addTarget(self, action: #selector(checking), for: .touchUpInside)
            return button
        }()
        var mCountTextField: UITextField = UITextField()
        mCountTextField.placeholder = "갯수를 입력하시오."
        let hStack = UIStackView(arrangedSubviews: [mCountTextField, text1, text2])
        hStack.axis = .horizontal
        hStack.spacing = 10
        // Spacer를 추가하여 text1과 text2를 좌우 정렬
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        hStack.addArrangedSubview(spacer)
        // 패딩 설정
        hStack.layoutMargins = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        hStack.isLayoutMarginsRelativeArrangement = true
        return hStack
    }()
    
    let sizeLStackView: UIStackView = {
//        firstCheckingButton
        let text1 = UILabel()
        text1.text = "L"
        let text2 = UILabel()
        text2.text = "23,000원"
        text2.textAlignment = .right
        let checkingButton: UIButton = {
//            var buttonStatus: Bool = false
            let button = UIButton()
            button.setTitle("버튼", for: .normal)
            button.backgroundColor = .gray // 버튼 배경색을 설정
            // 클릭 이벤트 핸들러 추가
            button.addTarget(self, action: #selector(checking), for: .touchUpInside)
            return button
        }()
        
        let lCountTextField: UITextField = UITextField()
//        let hStack = UIStackView(arrangedSubviews: [checkingButton, text1, text2])
        lCountTextField.placeholder = "갯수를 입력하시오."
        let hStack = UIStackView(arrangedSubviews: [lCountTextField, text1, text2])
        hStack.axis = .horizontal
        hStack.spacing = 10
        // Spacer를 추가하여 text1과 text2를 좌우 정렬
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        hStack.addArrangedSubview(spacer)
        // 패딩 설정
        hStack.layoutMargins = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        hStack.isLayoutMarginsRelativeArrangement = true
        return hStack
    }()
    
    let resultButton: UIButton = {
        let button = UIButton()
        button.setTitle("담기", for: .normal) // "담기" 텍스트 설정
        button.backgroundColor = .blue // 버튼 배경색을 민트색으로 설정
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 텍스트 크기와 굵기 설정
        button.setTitleColor(.white, for: .normal) // 텍스트 색상을 흰색으로 설정
//        button.addTarget(self, action: #selector(checking), for: .touchUpInside)
        return button

    }()
    
    
    // MARK: - BaseView
    override func setViewHierarchy() {
        self.backgroundColor = .white
        self.addSubviews(pizzaImage, stackView, firstDividerView, sizeMStackView, sizeLStackView, secondDividerView, resultButton)
    }
    override func layout() {
        pizzaImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(250)
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(pizzaImage.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        firstDividerView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        sizeMStackView.snp.makeConstraints {
            $0.top.equalTo(firstDividerView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        sizeLStackView.snp.makeConstraints {
            $0.top.equalTo(sizeMStackView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        secondDividerView.snp.makeConstraints {
            $0.top.equalTo(sizeLStackView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        resultButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-30)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
    
    @objc func buttonTapped() {
        // 버튼 텍스트를 다음 뷰 컨트롤러로 전달
        let nextViewController = NextViewController()
//        nextViewController.receivedText = sizeMStackView.mCountTextField.text
        
        // 다음 뷰 컨트롤러 표시
//        navigationController?.pushViewController(nextViewController, animated: true)
    }


    
}
