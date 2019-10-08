//
//  PacoteViagem.swift
//  CatiaViagens
//
//  Created by Catia Miranda de Souza on 08/10/19.
//  Copyright © 2019 Catia Miranda de Souza. All rights reserved.
//

import UIKit

class PacoteViagem: NSObject {
    
    let nomeDoHotel: String
    let descricao: String
    let dataViagem: String
    let viagem: Viagem
    
    init(nomeDoHotel: String, descricao: String, dataViagem: String, viagem: Viagem) {
        self.nomeDoHotel = nomeDoHotel
        self.descricao = descricao
        self.dataViagem = dataViagem
        self.viagem = viagem
        
    }
}
