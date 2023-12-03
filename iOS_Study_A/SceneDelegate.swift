//
//  SceneDelegate.swift
//  iOS_Study_A
//
//  Created by 김민지 on 2023/11/09.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene) // SceneDelegate의 프로퍼티에 설정해줌
        let mainViewController = ViewController() // 맨 처음 보여줄 ViewController

        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
    
    }
}
