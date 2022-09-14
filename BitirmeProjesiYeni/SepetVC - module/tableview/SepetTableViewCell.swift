//
//  SepetTableViewCell.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 8.09.2022.
//

import UIKit

class SepetTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var sYemekAdLabel: UILabel!
    @IBOutlet weak var sYemekAdetLabel: UILabel!
    @IBOutlet weak var sYemekFiyatLabel: UILabel!
    @IBOutlet weak var sYemekImageView: UIImageView!
    @IBOutlet weak var toplamFiyatLabel: UILabel!
    @IBOutlet weak var cellArkaPlan: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
