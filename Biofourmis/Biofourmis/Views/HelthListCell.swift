//
//  HelthListCell.swift
//  Biofourmis
//
//  Created by Aklesh Rathaur on 08/12/19.
//

import UIKit

class HelthListCell: UITableViewCell {
  
  @IBOutlet weak var lblPeriod: UILabel!
  @IBOutlet weak var lblAnyEHR: UILabel!
  @IBOutlet weak var lblCertifiedEHR: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
  
  func configureDetails(health:HealthObject)  {
    lblPeriod.text = "Period: \(health.period ?? "")"
    lblAnyEHR.text = health.anyEHR
    lblCertifiedEHR.text = health.certifiedEHR
  }
  
  func configureDetailsForCenter(center:MedicareCenter)  {
    lblPeriod.text = "Period: \(center.period ?? "")"
    lblAnyEHR.text = center.region
    lblCertifiedEHR.text = center.percentageofPhysicians
  }
}
