//
//  SepetRouter.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 13.09.2022.
//

import Foundation

class SepetRouter : PresenterToRouterSepetProtocol {
    static func creatModule(ref: SepetVC) {
        let presenter = SepetPresenter()
        
        // View
        ref.sepetPresenterNesnesi = presenter
        
        // Presenter
        ref.sepetPresenterNesnesi?.sepetInteractor = SepetInteractor()
        ref.sepetPresenterNesnesi?.sepetView = ref
        
        // Interactor
        ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter 
    }
     
}
