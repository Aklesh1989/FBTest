//
//  MedicareAndMedicaidServicesList.swift.swift
//  Biofourmis
//
//  Created by Aklesh Rathaur on 09/12/19.
//

import UIKit

class MedicareAndMedicaidServicesList: ParentVC {
  @IBOutlet weak var tblCenterList: UITableView!

  var arrayCenters = [MedicareCenter]()

    override func viewDidLoad() {
        super.viewDidLoad()
      prepareView()
      getCentersList()

    }
  
  func prepareView() {
    prepareNavigationItem()
    tblCenterList.tableFooterView = UIView()
  }
  
  func prepareNavigationItem() {
    let navItem = self.navigationItem as? BFNavigationItems
    navItem?.delegate  = self
    navItem?.itemLeft = .btnBack
    navItem?.itemTitle = .titleViewNonInteractive(title: "Medicare & Medicaid")
  }
  
  func getCentersList() {
    self.showSpinnerView()
    MedicareCenter.getCentersList { [weak self] (objects, error) in
      self?.hideSpinnerView()
      if let list = objects {
        self?.arrayCenters = list
        DispatchQueue.main.async {
          self?.tblCenterList.reloadData()
        }
        
      } else {
        if let errorFound = error {
          self?.showAlert(message: errorFound.localizedDescription)
        }
      }
      
    }
    
  }
  

}


extension MedicareAndMedicaidServicesList:UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrayCenters.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tblCenterList.dequeueReusableCell(withIdentifier: CellIdentifiers.cellHealthList) as? HelthListCell else {
      return UITableViewCell()
    }
    let center = arrayCenters[indexPath.row]
    cell.configureDetailsForCenter(center: center)

    cell.selectionStyle = .none
    return cell
  }
}


extension  MedicareAndMedicaidServicesList:BFNavigationItemsDelegate {
  func itemLeftTaped(sender: UIBarButtonItem) {
    self.navigationController?.popViewController(animated: true)
  }
  
  func itemRightTaped(sender: UIBarButtonItem) {
    
  }
}
