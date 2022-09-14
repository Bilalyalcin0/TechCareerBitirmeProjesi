//
//  DetayVC.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 6.09.2022.
//

import UIKit
import Alamofire
import Kingfisher

class DetayVC: UIViewController {
    
    @IBOutlet weak var detayImageView: UIImageView!
    @IBOutlet weak var detayFiyatLabel: UILabel!
    @IBOutlet weak var detayAdetLabel: UILabel!
    @IBOutlet weak var detayStepper: UIStepper!
    @IBOutlet weak var detayLabel: UILabel!
    
    var detayYemekDegiskeni : Yemekler?
    
    var detayPresenterNesnesi : ViewToPresenterDetayProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetayRouter.creatModule(ref: self)
        
        if let y = detayYemekDegiskeni {
            self.navigationItem.title = y.yemek_adi
            detayFiyatLabel.text = "\(y.yemek_fiyat!) ₺"
            
           func resimGoster(resimAdi:String) {
                if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
                    DispatchQueue.main.async {
                        //self.imageView.kf.setImage(with: url)
                        //hucre.yemekResimImageView.kf.setImage(with:url)
                    self.detayImageView.kf.setImage(with: url)
                    }
                }
            }
            resimGoster(resimAdi: y.yemek_resim_adi!)
            
        }
        
        detayAdetLabel.text = String(Int(detayStepper.value))
    }
   
    
    @IBAction func detayStepperAction(_ sender: UIStepper) {
        detayAdetLabel.text = String(Int(sender.value))
    }
  
    
    
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
    
        detayPresenterNesnesi?.Ekle(yemek_adi: (detayYemekDegiskeni?.yemek_adi)!, yemek_resim_adi: (detayYemekDegiskeni?.yemek_resim_adi)!, yemek_fiyat: (detayYemekDegiskeni?.yemek_fiyat)!, yemek_siparis_adet: String(Int(detayStepper.value)), kullanici_adi: "bilalyalcin")
        
    }
}


