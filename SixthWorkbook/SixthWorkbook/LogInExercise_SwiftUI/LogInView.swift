//
//  LogInView.swift
//  SixthWorkbook
//
//  Created by 김수민 on 2023/12/09.
//

import SwiftUI

struct LogInView: View {
    @State private var id: String = ""
    @State private var password: String = ""
    @State private var isAutoLogin: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    var body: some View {
        VStack {
               Text("이것은 푸터입니다.")
                   .padding()
               
               TextField("Enter ID", text: $id)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .padding()
               
               SecureField("Enter Password", text: $password)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .padding()
               
               Button(action: loginButtonTapped) {
                   Text("로그인")
                       .foregroundColor(.white)
                       .padding()
                       .frame(width: 200)
                       .background(Color.cyan)
               }
               
               Button(action: registerButtonTapped) {
                   Text("회원가입")
                       .foregroundColor(.white)
                       .padding()
                       .frame(width: 200)
                       .background(Color.cyan)
               }
               
               Button(action: logOutTapped) {
                   Text("로그아웃")
                       .foregroundColor(.white)
                       .padding()
                       .frame(width: 200)
                       .background(Color.cyan)
               }
        }
           .alert(isPresented: $showAlert) {
               Alert(title: Text("자동 로그인 활성화"), message: Text(alertMessage), primaryButton: .default(Text("예"), action: {
                   UserDefaults.standard.set(true, forKey: "isAutoLogin")
               }), secondaryButton: .default(Text("아니요"), action: {
                   UserDefaults.standard.set(false, forKey: "isAutoLogin")
               }))
           }
           .onAppear {
               if UserDefaults.standard.bool(forKey: "isAutoLogin") {
                   alertMessage = "자동 로그인을 활성화 하시겠습니까?"
                   showAlert = true
               }
           }
    }
        
    func loginButtonTapped() {
        if loginSuccessChecking() {
            alertMessage = "로그인 완료!"
            showAlert = true
        } else {
            alertMessage = "로그인 실패 ㅠㅠ"
            showAlert = true
        }
    }

    func registerButtonTapped() {
        guard !id.isEmpty, !password.isEmpty else {
            alertMessage = "값을 입력해주세요."
            showAlert = true
            return
        }
        UserDefaults.standard.set(id, forKey: "id")
        UserDefaults.standard.set(password, forKey: "password")
        alertMessage = "회원가입 완료!"
        showAlert = true
    }

    func logOutTapped() {
        UserDefaults.standard.removeObject(forKey: "isAutoLogin")
    }

    func loginSuccessChecking() -> Bool {
        return UserDefaults.standard.string(forKey: "id") == id && UserDefaults.standard.string(forKey: "password") == password
    }

}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
