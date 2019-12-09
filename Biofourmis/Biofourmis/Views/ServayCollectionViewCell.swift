//
//  ServayCollectionViewCell.swift
//  Biofourmis
//
//  Created by Aklesh Rathaur on 08/12/19.
//

import UIKit

class ServayCollectionViewCell: UICollectionViewCell {
  
  //MARK:- Outlet
  @IBOutlet weak var lblTitle: UILabel!
  
  //MARK:- Override
  override func awakeFromNib() {
    super.awakeFromNib()
    self.contentView.layer.cornerRadius = 1
    self.contentView.layer.borderColor = UIColor(red: 32.0/255.0, green: 131.0/255.0, blue: 175.0/255.0, alpha: 0.2).cgColor
    self.contentView.layer.borderWidth = 0.2
    }
  
}
