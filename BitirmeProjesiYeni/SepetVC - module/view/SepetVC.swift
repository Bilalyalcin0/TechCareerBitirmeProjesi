//
//  SepetVC.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 6.09.2022.
//

import UIKit
import Alamofire
import Kingfisher

class SepetVC: UIViewController {
    
    @IBOutlet weak var sepetTableView: UITableView!
    var adetBilgisi : DetayVC?
    
    var sepettekiYemeklerListe = [sepet_yemekler]()
   // var adetBilgisi : DetayVC?
    
    var sepetPresenterNesnesi : ViewToPresenterSepetProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        
        SepetRouter.creatModule(ref: self)
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.sepetYemekAl(kullanici_adi: "bilalyalcin")
        
    }
  
    
    
}


extension SepetVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepettekiYemeklerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sepet = sepettekiYemeklerListe[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucreSepet", for: indexPath) as! SepetTableViewCell
        
        cell.sYemekImageView.image = UIImage(named: sepet.yemek_resim_adi!)
        cell.sYemekAdLabel.text = sepet.yemek_adi
        cell.sYemekFiyatLabel.text = "\(sepet.yemek_fiyat!) ₺"
        cell.sYemekAdetLabel.text = sepet.yemek_siparis_adet
        cell.toplamFiyatLabel.text = String(Int((adetBilgisi?.detayStepper.value ?? 1)) * Int(sepet.yemek_fiyat!)!)
        
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.cellArkaPlan.layer.cornerRadius = 10.0
        
        cell.selectionStyle = .none
        
        func resimGoster(resimAdi:String) {
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
                DispatchQueue.main.async {
                    //self.imageView.kf.setImage(with: url)
                  //  hucre.yemekResimImageView.kf.setImage(with:url)
                    cell.sYemekImageView.kf.setImage(with: url)
                }
            }
        }
        resimGoster(resimAdi: sepet.yemek_resim_adi!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let silAction = UIContextualAction(style: .destructive, title: "Sil") { (ContextualAction,view,bool) in
        let sepet = self.sepettekiYemeklerListe[indexPath.row]
        
        let alert = UIAlertController(title: "Silme İslemi", message: "\(sepet.yemek_adi!) sepetten silinsin mı?", preferredStyle: .alert)
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
        alert.addAction(iptalAction)
        
        let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
        self.sepetPresenterNesnesi?.ySil(sepet_yemek_id: sepet.sepet_yemek_id!, kullanici_adi: "bilalyalcin")
            
            DispatchQueue.main.async {
                   self.sepetTableView.reloadData()
               }
            
          }
        alert.addAction(evetAction)
        self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    
}

extension SepetVC : PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepettekiYemeklerListe: Array<sepet_yemekler>) {
        self.sepettekiYemeklerListe = sepettekiYemeklerListe
        DispatchQueue.main.async {
               self.sepetTableView.reloadData()
           }
    }
    
}
