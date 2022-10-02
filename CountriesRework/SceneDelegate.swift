//
//  SceneDelegate.swift
//  CountriesRework
//
//  Created by Erdem Papakçı on 27.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private let storyboardName = "Main"
    private let tabbarControllerIdentifier = "TabBarController"
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let tabbarController = storyboard.instantiateViewController(withIdentifier: tabbarControllerIdentifier)
        let navigationController = UINavigationController(rootViewController: tabbarController)
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
}

