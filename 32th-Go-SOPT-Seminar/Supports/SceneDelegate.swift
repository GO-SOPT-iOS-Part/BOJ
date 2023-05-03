//
//  SceneDelegate.swift
//  32th-Go-SOPT-Seminar
//
//  Created by Joon Baek on 2023/04/01.
//

import UIKit

import Inject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
//        let injectViewController = Inject.ViewControllerHost(SignInViewController())
        let navigationController = UINavigationController(rootViewController: SignInViewController())
        self.window = UIWindow(windowScene: windowScene)
//        self.window?.rootViewController = injectViewController
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
