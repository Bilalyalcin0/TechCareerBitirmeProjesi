//
//  AyarlarVC.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 6.09.2022.
//

import UIKit

class AyarlarVC: UIViewController {
    @IBOutlet weak var ayarlarTableView: UITableView!
    
    var liste = [Ayarlar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ayarlarTableView.delegate = self
        ayarlarTableView.dataSource = self
        
        let a1 = Ayarlar(ayarlarLabel: "Önceki Siparişlerim")
        let a2 = Ayarlar(ayarlarLabel: "Hesabım")
        let a3 = Ayarlar(ayarlarLabel: "Adreslerim")
        let a4 = Ayarlar(ayarlarLabel: "Kuponlarım")
        let a5 = Ayarlar(ayarlarLabel: "Yardım Merkezi")
        
        liste.append(a1)
        liste.append(a2)
        liste.append(a3)
        liste.append(a4)
        liste.append(a5)
        ayarlarTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        
    }
    
    
}

extension AyarlarVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liste.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let liste = liste[indexPath.row]
        
        let cellAyarlar = tableView.dequeueReusableCell(withIdentifier: "cellAyarlar", for: indexPath) as! AyarlarTableViewCell
        
        cellAyarlar.ayarlarTVlabel.text = liste.ayarlarLabel
        return cellAyarlar
    }
    
}
