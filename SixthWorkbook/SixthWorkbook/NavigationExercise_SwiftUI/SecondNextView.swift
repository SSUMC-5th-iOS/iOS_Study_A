//
//  SecondNextView.swift
//  SixthWorkbook
//
//  Created by 김수민 on 2023/12/09.
//

import SwiftUI

struct secondNextView: View {
    @State var tag:Int? = nil
    @State private var count = 0
    @State private var showNextView = false

    var body: some View {
        HStack {
        
           Button(action: {
               count += 1
           }) {
               Image(systemName: "plus")
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
                   .clipShape(Circle())
           }
            Text("Count: \(count)")
                .font(.title)
           Button(action: {
               if count > 0 {
                   count -= 1
               }
           }) {
               Image(systemName: "minus")
                   .padding()
                   .background(Color.red)
                   .foregroundColor(.white)
                   .clipShape(Circle())
           }
            Text("")
       }
        NavigationLink(destination: thirdNextView(countValue: count), tag: 1, selection: self.$tag ) {
        }
        HStack {
        
            Button(action: {
                self.tag = 1
                
                print("Button Clicked!")
            }) {
                Text("확인")
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: 200)
            }
            .background(.mint)
        }
    }
}

struct SecondNextView_Previews: PreviewProvider {
    static var previews: some View {
        secondNextView()
    }
}
