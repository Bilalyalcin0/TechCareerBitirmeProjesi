//
//  AnasayfaRouter.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 13.09.2022.
//

import Foundation

class AnasayfaRouter : PresenterToRouterAnasayfaProtocol {
    static func creatModule(ref: AnasayfaVC) {
        let presenter = AnasayfaPresenter()
        
        ref.anasayfaPresenterNesnesi = presenter
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter 
    }
    
}
