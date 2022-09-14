//
//  SepetProtocols.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 13.09.2022.
//

import Foundation

// Ana Protocoller
protocol ViewToPresenterSepetProtocol {
    var sepetInteractor : PresenterToInteractorSepetProtocol? {get set}
    var sepetView : PresenterToViewSepetProtocol? {get set}
    
    func sepetYemekAl(kullanici_adi:String)
    func ySil(sepet_yemek_id: String,kullanici_adi:String)
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter : InteractoToPresenterSepetProtocol? {get set}
    
    func sepetekiYemekleriAlma(kullanici_adi:String)
    func yemekSil(sepet_yemek_id: String,kullanici_adi:String)
}


// Taşıyıcı Protocoller
protocol InteractoToPresenterSepetProtocol {
    func presenteraVeriGonder(sepettekiYemeklerListe:Array<sepet_yemekler>)
}

protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepettekiYemeklerListe:Array<sepet_yemekler>)
}

// Router
protocol PresenterToRouterSepetProtocol {
    static func creatModule(ref : SepetVC)
}
