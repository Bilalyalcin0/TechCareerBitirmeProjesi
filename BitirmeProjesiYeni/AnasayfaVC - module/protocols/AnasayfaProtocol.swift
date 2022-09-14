//
//  AnasayfaProtocol.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 13.09.2022.
//

import Foundation
    
    // Ana Protocol
protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor : PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView : PresenterToViewAnasayfaProtocol? {get set}
    
        func yemekleriYukle()
    }
    
protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter : InteractorToPresenterAnasayfaProtocol? {get set}
    
        func tumYemekleriAl()
    }
    
    // Taşıyıcı Protocol
protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemeklerListesi : Array<Yemekler>)
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi : Array<Yemekler>)
}

    // Router
protocol PresenterToRouterAnasayfaProtocol {
    static func creatModule(ref:AnasayfaVC)
}
