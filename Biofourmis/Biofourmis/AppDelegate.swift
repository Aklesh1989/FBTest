//
//  AppDelegate.swift
//  Biofourmis
//
//  Created by Aklesh Rathaur on 07/12/19.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    let navigationBarAppearace = UINavigationBar.appearance()
    navigationBarAppearace.tintColor = UIColor.white
    navigationBarAppearace.barTintColor = UIColor.white
    UIApplication.shared.statusBarUIView?.backgroundColor = ThemeColor

    return true
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
  }
  
  func applicationWillResignActive(_ application: UIApplication) {
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
  }

}

extension UIApplication {

    var statusBarUIView: UIView? {
        if #available(iOS 13.0, *) {
            let tag = 38482458
            if let statusBar = self.keyWindow?.viewWithTag(tag) {
                return statusBar
            } else {
                let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
                statusBarView.tag = tag

                self.keyWindow?.addSubview(statusBarView)
                return statusBarView
            }
        } else {
            if responds(to: Selector(("statusBar"))) {
                return value(forKey: "statusBar") as? UIView
            }
        }
        return nil
    }

}

