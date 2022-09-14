//
//  SepetPresenter.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 13.09.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    var sepetView: PresenterToViewSepetProtocol?
    var S : ViewToPresenterSepetProtocol?
    
    func sepetYemekAl(kullanici_adi: String) {
        sepetInteractor?.sepetekiYemekleriAlma(kullanici_adi: kullanici_adi)
    }
    
    func ySil(sepet_yemek_id: String, kullanici_adi: String) {
        sepetInteractor?.yemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
}

extension SepetPresenter : InteractoToPresenterSepetProtocol {
    func presenteraVeriGonder(sepettekiYemeklerListe: Array<sepet_yemekler>) {
     
          sepetView?.vieweVeriGonder(sepettekiYemeklerListe: sepettekiYemeklerListe)
     
    }
    
}
