//
//  DetayPresenter.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 13.09.2022.
//

import Foundation

class DetayPresenter : ViewToPresenterDetayProtocol {
    var detayInteractor: PresenterToInteractorDetayProtocol?
    
    func Ekle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        detayInteractor?.sepeteYemekEkleme(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
    
}
