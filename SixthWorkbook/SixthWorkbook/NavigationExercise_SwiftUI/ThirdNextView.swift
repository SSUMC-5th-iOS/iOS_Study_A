//
//  ThirdNextView.swift
//  SixthWorkbook
//
//  Created by 김수민 on 2023/12/09.
//

import SwiftUI

struct thirdNextView: View {
    let countValue: Int
    var body: some View {
        VStack {
            Text("This is \(countValue)")
                .padding()
        }
        .navigationTitle("Next View")
    }
}

struct ThirdNextView_Previews: PreviewProvider {
    static var previews: some View {
        thirdNextView(countValue: 2)
    }
}
