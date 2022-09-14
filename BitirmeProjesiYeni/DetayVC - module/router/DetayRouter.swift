//
//  DetayRouter.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 13.09.2022.
//

import Foundation

class DetayRouter : PresenterToRouterDetayProtocol {
    static func creatModule(ref: DetayVC) {
        ref.detayPresenterNesnesi = DetayPresenter()
        ref.detayPresenterNesnesi?.detayInteractor = DetayInteractor()
    }
    
}
