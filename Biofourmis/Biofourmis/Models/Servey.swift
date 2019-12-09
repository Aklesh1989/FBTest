//
//  Servey.swift
//  Biofourmis
//
//  Created by Aklesh Rathaur on 08/12/19.
//

import UIKit

class Servey: NSObject {
  
  struct Key
   {
     fileprivate static let name  = "name"
     fileprivate static let api = "api"

   }
  
  
   var name:String!
   var api:String!

  
  //MARK:- init methods
  override init(){}
  
  init(fromDictionary dictionary: [String:Any]) {
    name = dictionary[Key.name] as? String ?? ""
    api = dictionary[Key.api] as? String ?? ""
  }
  
  
  func encode(with coder: NSCoder) {
    if name != nil {
      coder.encode(name, forKey: Key.name)
    }
    if api != nil {
      coder.encode(api, forKey: Key.api)
    }
  }
  
  required init?(coder: NSCoder) {
    name = coder.decodeObject(forKey: Key.name) as? String
    api = coder.decodeObject(forKey: Key.api) as? String


  }
  
  func toDictionary() -> [String:Any] {
    var dictionary: [String: Any] = [:]
    dictionary[Key.api] = api
    dictionary[Key.name] = name
    return dictionary
  }
  

}

extension Servey {
  
 class func getAllServey() -> [Servey] {
  
  let servey1 = Servey(fromDictionary: ["name":"Office-based Physician Health IT Adoption and Use","api":WebCallPath.office_based_Physician])
  
  
    let servey2 = Servey(fromDictionary: ["name":"2015 Edition Market Readiness for Hospitals and Clinicians Data","api":WebCallPath.edition_2015])
    
    let servey3 = Servey(fromDictionary: ["name":"Centers for Medicare & Medicaid Services (CMS) EHR Incentive Program Measures","api":WebCallPath.meaningfulUseAcceleration])
    
    let servey4 = Servey(fromDictionary: ["name":"EHR Developers Reported by Health Care Providers Participating in Federal Programs","api":WebCallPath.EHRVendors])
    
    let servey5 = Servey(fromDictionary: ["name":"Effects of Meaningful Use Functionalities on Health Care Quality, Safety, and Efficiency","api":WebCallPath.systematicLitReview])
    
    let servey6 = Servey(fromDictionary: ["name":"Electronic Prescribing Adoption and Use by County","api":WebCallPath.surescriptsByCounty])
    
    let servey7 = Servey(fromDictionary: ["name":"Electronic Prescribing Adoption and Use by State","api":WebCallPath.surescriptsByState])
    
    let servey8 = Servey(fromDictionary: ["name":"Federal Health IT Strategic Plan: 2015-2020 Goals","api":WebCallPath.federalHealth])
    
    let servey9 = Servey(fromDictionary: ["name":"Hospital Public Health Reporting","api":WebCallPath.publicHealthMeasures])
    
    let servey10 = Servey(fromDictionary: ["name":"Non-federal Acute Care Hospital Health IT Adoption and Use","api":WebCallPath.AHA_2008_2017])
    
    let servey11 = Servey(fromDictionary: ["name":"ONC Budget Performance Measure Data","api":WebCallPath.performanceMeasures])
    
    let servey12 = Servey(fromDictionary: ["name":"ONC Community College Consortia to Educate Health IT Professionals Program Key Performance Indicators (KPIs)","api":WebCallPath.comm_College_Consortia_KPI])
    
    let servey13 = Servey(fromDictionary: ["name":"ONC Health Information Technology for Economic and Clinical Health (HITECH) Grantee Crosswalk","api":WebCallPath.dashboard_AreaType_Crosswalk])
    
    let servey14 = Servey(fromDictionary: ["name":"ONC Health Information Technology for Economic and Clinical Health (HITECH) Grantee List","api":WebCallPath.oNC_HITECH_Grantee_List])
    
    let servey15 = Servey(fromDictionary: ["name":"ONC Regional Extension Centers (REC) Key Performance Indicators (KPIs) by County","api":WebCallPath.rEC_KPI_County])
    
    let servey16 = Servey(fromDictionary: ["name":"ONC Regional Extension Centers (REC) Key Performance Indicators (KPIs) by Grantee","api":WebCallPath.rEC_KPI_Masterfile])
    
    let servey17 = Servey(fromDictionary: ["name":"ONC Regional Extension Centers (REC) Key Performance Indicators (KPIs) by State","api":WebCallPath.rEC_KPI_State])
    
    let array:[Servey] = [servey1,servey3,servey4,servey5,servey6,servey7,servey8,
    servey9,servey10,servey11,servey12,servey13,servey14,servey15,servey2,servey16,servey17]
    
    return array
    
    
    
  }
}
