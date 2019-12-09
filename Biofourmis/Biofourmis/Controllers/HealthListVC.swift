//
//  ListViewController.swift
//  Biofourmis
//
//  Created by Aklesh Rathaur on 08/12/19.
//

import UIKit

class HealthListVC: ParentVC {
  
  @IBOutlet weak var tblHealthList: UITableView!

  var healthList = [HealthObject]()
  var healthDictionary = [String: [HealthObject]]()
  var arrayRegion = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
      prepareView()
        getHealthList()
      
    }
  
  func prepareView() {
    prepareNavigationItem()
    tblHealthList.tableFooterView = UIView()
  }
  
  func prepareNavigationItem() {
    let navItem = self.navigationItem as? BFNavigationItems
    navItem?.delegate  = self
    navItem?.itemLeft = .btnBack
    navItem?.itemTitle = .titleViewNonInteractive(title: "Health IT Adoption")
  }
  
  func getHealthList() {
    self.showSpinnerView()
    HealthObject.getHealthServeyList { [weak self] (objects, error) in
      self?.hideSpinnerView()
      if let list = objects {
        self?.healthList = list
        DispatchQueue.main.async {
          self?.configureListToDisplay()
        }
        
      } else {
        if let errorFound = error {
          self?.showAlert(message: errorFound.localizedDescription)
        }
      }
      
    }
    
  }
  
  func configureListToDisplay() {
     for health in healthList {
       let key = String(health.region)
             if var values = healthDictionary[key] {
                 values.append(health)
                 healthDictionary[key] = values
             } else {
                 healthDictionary[key] = [health]
             }
     }
     arrayRegion = [String](healthDictionary.keys)
     arrayRegion = arrayRegion.sorted(by: { $0 < $1 })
     self.tblHealthList.reloadData()
     
   }
    
}

extension HealthListVC:UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return arrayRegion.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let key = arrayRegion[section]
    if let list = healthDictionary[key] {
        return list.count
    }
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tblHealthList.dequeueReusableCell(withIdentifier: CellIdentifiers.cellHealthList) as? HelthListCell else {
      return UITableViewCell()
    }
    
    let key = arrayRegion[indexPath.section]
       if let list = healthDictionary[key] {
           let healthObject = list[indexPath.row]
        cell.configureDetails(health: healthObject)

       }
    cell.selectionStyle = .none
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     return arrayRegion[section]
   }
}

  
 
  
extension  HealthListVC:BFNavigationItemsDelegate {
  func itemLeftTaped(sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
  }
  
  func itemRightTaped(sender: UIBarButtonItem) {
    
  }
}
