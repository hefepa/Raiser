//
//  SceneDelegate.swift
//  InvestmentApp
//
//  Created by WEMA on 05/02/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        //let loginPage = TabViewController(nibName: "TabViewController", bundle: nil)
//        let loginPage = JoinGroupViewController(nibName: "JoinGroupViewController", bundle: nil)

//        let loginPage = HomeViewController(nibName: "HomeViewController", bundle: nil)
//       let loginPage = LearnViewController(nibName: "LearnViewController", bundle: nil)
//        let loginPage = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        //let loginPage = OnboardingViewController(nibName: "OnboardingViewController", bundle: nil)
        //let loginPage = ResetPasswordViewController(nibName: "ResetPasswordViewController", bundle: nil)
//        let loginPage = InvestmentViewController(nibName: "InvestmentViewController", bundle: nil)
//        let loginPage = SplashScreenViewController(nibName: "SplashScreenViewController", bundle: nil)
//        let loginPage = GroupInvestmentViewController(nibName: "GroupInvestmentViewController", bundle: nil)
        let loginPage = LoginPageViewController(nibName: "LoginPageViewController", bundle: nil)
        //let loginPage = OTPViewController(nibName: "OTPViewController", bundle: nil)
        let rootViewController = UINavigationController(rootViewController: loginPage)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

