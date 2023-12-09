//
//  TabButtonView.swift
//  SixthWorkbook
//
//  Created by 김수민 on 2023/12/08.
//

import SwiftUI

struct TabButtonView: View {
    var image: String = ""
    var title: String = ""
    var body: some View {
        Button(action: {}){
            VStack{
                Image(systemName: image)
                Text(title)
            }
        }
    }
}

struct TabButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TabButtonView(image: "heart", title: "찜")
    }
}
