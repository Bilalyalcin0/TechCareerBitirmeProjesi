//
//  sepet_yemekler.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 6.09.2022.
//

import Foundation

class sepet_yemekler : Codable {  // sepettekiYemekleriGetir'i bu tablodan yapacagız. {GET}
    
    var sepet_yemek_id : String?   // Int?
    var yemek_adi : String?
    var yemek_resim_adi : String?
    var yemek_fiyat : String?     // Int?
    var yemek_siparis_adet : String?    // Int?
    var kullanici_adi : String?
    
    init(sepet_yemek_id: String, yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        self.sepet_yemek_id = sepet_yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
        self.yemek_siparis_adet = yemek_siparis_adet
        self.kullanici_adi = kullanici_adi
    }
    
    
}

// Sepete yemek ekleme , Sepetten yemek silme ve Resim alma işlemlerinin hepsi {POST} türünde olacak.
