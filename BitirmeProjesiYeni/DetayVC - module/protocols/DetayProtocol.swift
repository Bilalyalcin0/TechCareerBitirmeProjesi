//
//  DetayProtocol.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 13.09.2022.
//

import Foundation

protocol ViewToPresenterDetayProtocol {
    
    var detayInteractor : PresenterToInteractorDetayProtocol? {get set}
    
    func  Ekle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,yemek_siparis_adet:String,kullanici_adi:String)
}

protocol PresenterToInteractorDetayProtocol {
    func sepeteYemekEkleme(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,yemek_siparis_adet:String,kullanici_adi:String)
}

protocol PresenterToRouterDetayProtocol {
    static func creatModule(ref: DetayVC)
}
