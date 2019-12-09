//
//  MedicareCenter.swift
//  Biofourmis
//
//  Created by Aklesh Rathaur on 09/12/19.
//

import UIKit

class MedicareCenter: NSObject,NSCoding {
  
  struct Key
   {
     fileprivate static let region  = "region"
     fileprivate static let period = "period"
     fileprivate static let percentageofPhysicians = "pct_md_pa_np_mu_aiu"

   }
  
  
   var region:String!
   var period:String!
   var percentageofPhysicians:String!

  
  //MARK:- init methods
  override init(){}
  
  init(fromDictionary dictionary: [String:Any]) {
    region = dictionary[Key.region] as? String ?? "No Region"
    period = dictionary[Key.period] as? String ?? ""
    percentageofPhysicians = dictionary[Key.percentageofPhysicians] as? String ?? ""

  }
  
  
  func encode(with coder: NSCoder) {
    if region != nil {
      coder.encode(region, forKey: Key.region)
    }
    if period != nil {
      coder.encode(period, forKey: Key.period)
    }
    if percentageofPhysicians != nil {
      coder.encode(percentageofPhysicians, forKey: Key.percentageofPhysicians)
    }
  }
  
  required init?(coder: NSCoder) {
    region = coder.decodeObject(forKey: Key.region) as? String
    period = coder.decodeObject(forKey: Key.period) as? String
    percentageofPhysicians = coder.decodeObject(forKey: Key.percentageofPhysicians) as? String


  }
  
  func toDictionary() -> [String:Any] {
    var dictionary: [String: Any] = [:]
    dictionary[Key.region] = region
    dictionary[Key.period] = period
    dictionary[Key.percentageofPhysicians] = percentageofPhysicians
    return dictionary
  }
  

}

extension MedicareCenter {
  
  class func getCentersList(withCompletionHandler completionHandler:@escaping ((_ success:[MedicareCenter]?,_ failure:NSError?)->Void)){
    let url = WebCallPath.meaningfulUseAcceleration
     _ = WebCallsHelper.callWebService(withUrlStr: url, httpMethod: WebCallType.get, queryParams: nil, bodyParams: nil) { (data, error) in
       if let object = data {
         if let array = object[WebCallPredefinedKeys.kData] as? [[String : Any]] {
           let arrayToSend = array.map { (dict) -> MedicareCenter in
             return MedicareCenter(fromDictionary: dict)
           }
           completionHandler(arrayToSend,nil)
           return
         }
         completionHandler(nil, error)
       } else {
         completionHandler(nil, error)
       }
     }
     
   }
  
}
