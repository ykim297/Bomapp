//
//  SceneDelegate+Function.swift
//  Bomapp
//
//  Created by Yong Seok Kim on 2020/07/04.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

extension SceneDelegate {
    func setRootViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        DispatchQueue.main.async {
            let registerStoryboard = UIStoryboard(name: "Search", bundle: nil)
            let viewController = registerStoryboard.instantiateViewController(withIdentifier: "SearchMainView")
            let navigationController = BaseNavigationController(rootViewController: viewController)
            navigationController.navigationBar.isTranslucent = false
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }
    }
}
