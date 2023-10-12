//
//  DividerView.swift
//  test
//
//  Created by 김수민 on 2023/10/12.
//

import UIKit

class DividerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Divider의 색상과 스타일 설정
        backgroundColor = UIColor.separator // 시스템 구분선 색상 사용 (iOS 13 이상)
        // backgroundColor = UIColor.lightGray // Divider의 색상 설정 (iOS 12 이하)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
