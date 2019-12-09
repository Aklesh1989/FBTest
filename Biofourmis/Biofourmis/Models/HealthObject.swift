//
//  HealthObject.swift
//  Biofourmis
//
//  Created by Aklesh Rathaur on 08/12/19.
//

import UIKit

class HealthObject: NSObject, NSCoding {
  
  struct Key
   {
     fileprivate static let region  = "region"
     fileprivate static let period = "period"
     fileprivate static let anyEHR = "pct_phys_any_ehr"
     fileprivate static let certifiedEHR = "pct_phys_cert_ehr"

   }
  
  
   var region:String!
   var period:String!
   var anyEHR:String!
   var certifiedEHR : String!

  
  //MARK:- init methods
  override init(){}
  
  init(fromDictionary dictionary: [String:Any]) {
    region = dictionary[Key.region] as? String ?? "No Region"
    period = dictionary[Key.period] as? String ?? ""
    anyEHR = dictionary[Key.anyEHR] as? String ?? ""
    certifiedEHR = dictionary[Key.certifiedEHR] as? String ?? ""

  }
  
  
  func encode(with coder: NSCoder) {
    if region != nil {
      coder.encode(region, forKey: Key.region)
    }
    if period != nil {
      coder.encode(period, forKey: Key.period)
    }
    if anyEHR != nil {
      coder.encode(anyEHR, forKey: Key.anyEHR)
    }
    if certifiedEHR != nil {
      coder.encode(certifiedEHR, forKey: Key.certifiedEHR)
    }
  }
  
  required init?(coder: NSCoder) {
    region = coder.decodeObject(forKey: Key.region) as? String
    period = coder.decodeObject(forKey: Key.period) as? String
    anyEHR = coder.decodeObject(forKey: Key.anyEHR) as? String
    certifiedEHR = coder.decodeObject(forKey: Key.certifiedEHR) as? String


  }
  
  func toDictionary() -> [String:Any] {
    var dictionary: [String: Any] = [:]
    dictionary[Key.region] = region
    dictionary[Key.period] = period
    dictionary[Key.anyEHR] = anyEHR
    dictionary[Key.certifiedEHR] = certifiedEHR
    return dictionary
  }
  

}

extension HealthObject {
  
  class func getHealthServeyList(withCompletionHandler completionHandler:@escaping ((_ success:[HealthObject]?,_ failure:NSError?)->Void)){
    let url = WebCallPath.office_based_Physician
     _ = WebCallsHelper.callWebService(withUrlStr: url, httpMethod: WebCallType.get, queryParams: nil, bodyParams: nil) { (data, error) in
       if let object = data {
         if let array = object[WebCallPredefinedKeys.kData] as? [[String : Any]] {
           let arrayToSend = array.map { (dict) -> HealthObject in
             return HealthObject(fromDictionary: dict)
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
