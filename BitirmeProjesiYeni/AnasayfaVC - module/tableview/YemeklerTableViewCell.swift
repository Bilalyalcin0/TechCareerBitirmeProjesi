//
//  YemeklerTableViewCell.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 6.09.2022.
//

import UIKit

class YemeklerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var yemekResimImageView: UIImageView!
    @IBOutlet weak var yemekAdLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    @IBOutlet weak var hucreArkaPlan: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
