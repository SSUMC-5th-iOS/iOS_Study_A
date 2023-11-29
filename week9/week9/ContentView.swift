//
//  ContentView.swift
//  week9
//
//  Created by 박현수 on 2023/11/29.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseAuth
import DeviceCheck


struct NextView: View {
    @Environment(\.dismiss) private var dismiss
    
    let userEmail: String
    
    init(userEmail: String) {
        self.userEmail = userEmail
    }
    
    
    var body: some View {
        VStack(spacing: 30){
            
            Text("\(userEmail)님 로그인되었습니다!").font(.title).bold()
            
            Text("로그아웃").onTapGesture {
                try? Auth.auth().signOut()
                let defaults = UserDefaults.standard
                defaults.set(false, forKey: "isAutoLogin")
                
                dismiss()
            }
            
        }
    }
}

struct ContentView: View {
    @State private var status = "Welcome"
    @State private var userEmail = ""
    @State private var password = ""
    @State var isPresented = false
    
    func autoLogin() {
        let defaults = UserDefaults.standard
        if let isAutoLogin = defaults.object(forKey: "isAutoLogin") as? Bool, isAutoLogin {
            if let savedEmail = defaults.string(forKey: "savedEmail"),
               let savedPassword = defaults.string(forKey: "savedPassword") {
                Auth.auth().signIn(withEmail: savedEmail, password: savedPassword) { _, error in
                    if let error = error {
                        status = "Auto login failed: \(error.localizedDescription)"
                    } else {
                        userEmail = savedEmail
                        isPresented.toggle()
                    }
                }
            }
        }
    }
    
    var body: some View {
        
        VStack {
            VStack(spacing: 20) {
                Text(status).font(.headline)
                
                TextField("아이디", text: $userEmail)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                SecureField("비밀번호", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                Button(action: {
                    Auth.auth().signIn(withEmail: userEmail, password: password) { authResult, error in
                        if let error = error {
                            status = error.localizedDescription
                        }
                        else {
                            isPresented.toggle()
                            let defaults = UserDefaults.standard
                            defaults.set(userEmail, forKey: "savedEmail")
                            defaults.set(password, forKey: "savedPassword")
                            defaults.set(true, forKey: "isAutoLogin")
                        }
                    }
                }) {
                    Text("로그인")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(Color.blue)
                        .cornerRadius(8)
                }.fullScreenCover(isPresented: $isPresented) {
                    NextView(userEmail: userEmail)
                }
                
                Button(action: {
                    Auth.auth().createUser(withEmail: userEmail, password: password) { authResult, error in
                        guard let user = authResult?.user, error == nil else {
                            status = error!.localizedDescription
                            return
                        }
                        status = "\(user.email!) 님 회원가입이 완료되었습니다!"
                    }
                }) {
                    Text("회원가입")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
        }.padding()
            .onAppear {
                let defaults = UserDefaults.standard
                if let object = defaults.object(forKey: "isAutoLogin") as? Bool, object{
                    autoLogin()
                }
          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
