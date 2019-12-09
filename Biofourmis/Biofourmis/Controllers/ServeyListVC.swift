//
//  ServeyListVCViewController.swift
//  Biofourmis
//
//  Created by Aklesh Rathaur on 08/12/19.
//

import UIKit

class ServeyListVC: UIViewController {
  
  @IBOutlet weak var collectionViewServey: UICollectionView!


  var serveyList = [Servey]()
    override func viewDidLoad() {
        super.viewDidLoad()
      prepareNavigationItem()
      serveyList.append(contentsOf: Servey.getAllServey())
      collectionViewServey.register(UINib.init(nibName: CellNib.Servey, bundle: nil), forCellWithReuseIdentifier: CellIdentifiers.cellServey)

    }
  
  func prepareNavigationItem() {
    let navItem = self.navigationItem as? BFNavigationItems
    navItem?.itemTitle = .titleViewNonInteractive(title: "Dashboard")
  }
  
  
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()

    guard let flowLayout = collectionViewServey.collectionViewLayout as? UICollectionViewFlowLayout else {
      return
    }

    if UIApplication.shared.statusBarOrientation.isLandscape {
      flowLayout.itemSize = CGSize.init(width: (self.collectionViewServey.frame.size.width)/3, height: 120)
      //here you can do the logic for the cell size if phone is in landscape
    } else {
      flowLayout.itemSize = CGSize.init(width: (self.collectionViewServey.frame.size.width)/2, height: 120)
    }

    flowLayout.invalidateLayout()
    collectionViewServey.reloadData()
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
  {
    coordinator.animate(alongsideTransition: { (_) in

       }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
             self.collectionViewServey.reloadData()

       })
    super.viewWillTransition(to: size, with: coordinator)
  }
  
 

}


//MARK:- UICollectionViewDataSource
//MARK:  UICollectionViewDelegate
//MARK:  UICollectionViewDelegateFlowLayout -
extension ServeyListVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print("array count is \(serveyList.count)")
    return serveyList.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionViewServey.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.cellServey,
                                                                      for: indexPath) as! ServayCollectionViewCell
    let servey = serveyList[indexPath.row]
    cell.lblTitle.text = servey.name
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    switch indexPath.row {
    case 0:
      self.performSegue(withIdentifier: SegueIdentifiers.DashBoardToHealthList, sender: nil)
    case 1:
           self.performSegue(withIdentifier: SegueIdentifiers.DashBoardToMedicareServicesList, sender: nil)
    default:
      showAlert(message: "Navigations are implemented for first two section.", title: "Instruction")
    }
   
  }

 /* func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionView.elementKindSectionHeader:
      viewHeader = collectionProducts.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as? BigCollectionHeaderView
     // viewHeader?.lblTitle.text = "asjhfjhf jahfjh fjdhf fjkj 1234567981011121314151617"
      viewHeader?.lblTitle.text = strTitle
      
      return viewHeader!
    default:
      assert(false, "Unexpected element kind")
    }
  }*/
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    var cellSize: CGSize = CGSize()
    
    switch UIDevice.current.orientation{
    case .portrait:
        cellSize = CGSize.init(width: (self.collectionViewServey.frame.size.width)/2, height: 120)
    case .portraitUpsideDown:
        cellSize = CGSize.init(width: (self.collectionViewServey.frame.size.width)/2, height: 120)
    case .landscapeLeft:
        cellSize = CGSize.init(width: (self.collectionViewServey.frame.size.width)/3, height: 120)
    case .landscapeRight:
        cellSize = CGSize.init(width: (self.collectionViewServey.frame.size.width)/3, height: 120)
    default:
        cellSize = CGSize.init(width: (self.collectionViewServey.frame.size.width)/2, height: 120)
    }
    return cellSize
  }
}
