//
//  ParentVC.swift
//  Biofourmis
//
//  Created by Aklesh Rathaur on 08/12/19.
//

import UIKit

class ParentVC: UIViewController {

  var child : UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
      if #available(iOS 13.0, *) {
          overrideUserInterfaceStyle = .light
      }
    }
  
    func showSpinnerView() {
      child = SpinnerViewController()
      child?.view.frame = self.view.frame
      if let window = APP_DELEGATE.window {
        child!.view.center = window.center
        window.addSubview(child!.view)
      }
    }
  
  func hideSpinnerView() {
    if let childview  = child {
      childview.view.removeFromSuperview()
    }
  }
    


}
