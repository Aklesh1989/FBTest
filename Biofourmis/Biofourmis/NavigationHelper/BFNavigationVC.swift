//
//  BFNavigationVC.swift
//  Biofourmis
//
//  Created by Aklesh Rathaur on 08/12/19.
//

import UIKit

class BFNavigationVC: UINavigationController {
  
  // MARK: - Override
  override func viewDidLoad() {
    super.viewDidLoad()
    if #available(iOS 13.0, *) {
        overrideUserInterfaceStyle = .light
    }
    if #available(iOS 11.0, *) {
      self.navigationBar.prefersLargeTitles = false
    }
    self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    self.navigationBar.shadowImage = UIImage()
    self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    
    
   
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
