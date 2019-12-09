//
//  Constant.swift
//  Biofourmis
//
//  Created by Aklesh Rathaur on 07/12/19.
//

import UIKit

// Colors


struct CellNib {
  static let Servey: String = "ServayCollectionViewCell"
}

struct CellIdentifiers {
  static let cellServey: String = "ServayCollectionViewCell"
  static let cellHealthList: String = "HelthListCell"
}

struct SegueIdentifiers {
  static let DashBoardToHealthList: String = "DashBoardToHealthList"
  static let DashBoardToMedicareServicesList: String = "DashBoardToMedicareServicesList"
  
}



let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate
//let ThemeColor = UIColor(red: 32.0/255.0, green: 131.0/255.0, blue: 175.0/255.0, alpha: 1)
let ThemeColor = UIColor.white

public func downloadImage(from imageUrl:String, completionHandler:@escaping ((_ image:UIImage?)->Void)) {
  let completeImageUrl = baseUrl + imageUrl
  guard let url = URL(string: completeImageUrl) else {
    completionHandler(nil)
    return
  }
     getData(from: url) { data, response, error in
         guard let data = data, error == nil else { return }
         print(response?.suggestedFilename ?? url.lastPathComponent)
         print("Download Finished")
         let image = UIImage(data: data)
         completionHandler(image)
     }
 }

public func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
}


extension UIViewController {
  func showAlert(message:String ,title:String = "Error") {
      
      let alert = UIAlertController(title: title,
                                    message: message,
                                    preferredStyle: .alert)
      
      let action = UIAlertAction(title: "Cancel", style: .default, handler: nil)
      if #available(iOS 13.0, *) {
          // Always adopt a light interface style.
        alert.overrideUserInterfaceStyle = .light
      }
      alert.addAction(action)
      self.present(alert, animated: true, completion: nil)
    }
  
  func showAlert(title: String? = nil, message:String, cancelButtonTitle: String = "OK", handler: ((UIAlertAction) -> Swift.Void)? = nil) {
    var strTitle: String? = title
    var strMessage: String? = message
    
    if strTitle == nil {
      strTitle = message
      strMessage = nil
    }
    
    let alert = UIAlertController(title: strTitle,
                                  message: strMessage,
                                  preferredStyle: .alert)
    
    let action = UIAlertAction(title: cancelButtonTitle, style: .default, handler: handler)
    if #available(iOS 13.0, *) {
        // Always adopt a light interface style.
      alert.overrideUserInterfaceStyle = .light
    }
    
    alert.addAction(action)
    
    self.present(alert, animated: true, completion: nil)
  }
  
}







