//
//  week10App.swift
//  week10
//
//  Created by 박현수 on 2023/11/30.
//

import SwiftUI
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon

@main
struct week10App: App {
    
    init() {
        KakaoSDK.initSDK(appKey: "c06f214df5044c68afa5d7bb40e9aea9")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().onOpenURL(perform: { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    AuthController.handleOpenUrl(url: url)
                }
            })
        }
    }
}
