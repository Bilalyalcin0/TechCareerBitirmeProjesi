//
//  ViewController.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 5.09.2022.
//

import UIKit
import Alamofire
import Kingfisher

class AnasayfaVC: UIViewController {
    
    @IBOutlet weak var yemeklerTableView: UITableView!
    
    var yemeklerListe = [Yemekler]()
    var anasayfaPresenterNesnesi : ViewToPresenterAnasayfaProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        yemeklerTableView.delegate = self
        yemeklerTableView.dataSource = self
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.systemGray6
        
        renkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
        renkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
        renkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
        yemeklerTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        
       
        
        AnasayfaRouter.creatModule(ref: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yemekleriYukle()
    }
    
    func renkDegistir(itemAppearance:UITabBarItemAppearance){
        // Seçili Durum
        itemAppearance.selected.iconColor = UIColor.systemBlue
        itemAppearance.selected.titleTextAttributes = [.foregroundColor : UIColor.systemBlue]
        itemAppearance.selected.badgeBackgroundColor = UIColor.systemMint
        
        // Seçili Olmayan Durum
        itemAppearance.normal.iconColor = UIColor.systemGray
        itemAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.systemGray]
        itemAppearance.normal.badgeBackgroundColor = UIColor.systemRed
        
    }
    
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
        DispatchQueue.main.async {
             self.yemeklerTableView.reloadData()
         }
    }
}

extension AnasayfaVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemeklerListe[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "hucreAnasayfa", for: indexPath) as! YemeklerTableViewCell
        
        hucre.yemekResimImageView.image = UIImage(named: yemek.yemek_resim_adi!)
        hucre.yemekAdLabel.text = yemek.yemek_adi
        hucre.yemekFiyatLabel.text = "\(yemek.yemek_fiyat!) ₺"
        
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.hucreArkaPlan.layer.cornerRadius = 10.0
        
        hucre.selectionStyle = .none
        
    
        
        func resimGoster(resimAdi:String) {
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
                DispatchQueue.main.async {
                    //self.imageView.kf.setImage(with: url)
                    hucre.yemekResimImageView.kf.setImage(with:url)
                }
            }
        }
        resimGoster(resimAdi: yemek.yemek_resim_adi!)
        
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemeklerListe[indexPath.row]
        performSegue(withIdentifier: "toDetayVC", sender: yemek)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetayVC" {
            if let y = sender as? Yemekler {
                let gidilecekVC = segue.destination as! DetayVC
                gidilecekVC.detayYemekDegiskeni = y
            }
        }
    }
}
