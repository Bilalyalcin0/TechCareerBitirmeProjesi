//
//  SepetInteractor.swift
//  BitirmeProjesiYeni
//
//  Created by Bilal Yalcin on 13.09.2022.
//

import Foundation
import Alamofire

class SepetInteractor : PresenterToInteractorSepetProtocol {
    var sepetPresenter: InteractoToPresenterSepetProtocol?
    
    func sepetekiYemekleriAlma(kullanici_adi: String) {
        let params : Parameters = ["kullanici_adi":kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(SepetCevap.self, from: data)
                    if let liste = cevap.sepet_yemekler {
                        self.sepetPresenter?.presenteraVeriGonder(sepettekiYemeklerListe: liste)
                        
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func yemekSil(sepet_yemek_id: String, kullanici_adi: String) {
        let params : Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                    self.sepetekiYemekleriAlma(kullanici_adi: "bilalyalcin")
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
