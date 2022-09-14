//
//  Yemekler.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 6.09.2022.
//

import Foundation

class Yemekler : Codable {   // tumYemekleriGetir'i bu tablodan yapacagız. {GET}
    
    var yemek_id : String?    // Int?
    var yemek_adi : String?
    var yemek_resim_adi : String?
    var yemek_fiyat : String?   // Int?
    
    init(yemek_id: String, yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String) {
        self.yemek_id = yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
    }
    
}
