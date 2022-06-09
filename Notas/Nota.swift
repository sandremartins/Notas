//
//  Nota.swift
//  Notas
//
//  Created by Alessandre Martins on 6/8/22.
//

import Foundation

struct Nota: Identifiable {
    var id = UUID()
    
    let notaText: String
    var liked: Bool = false
}

var testData = [
    Nota(notaText: "Ser ou não ser, eis a questão", liked: true),
    Nota(notaText: "Grandes poderes, grandes responsabilidades"),
    Nota(notaText: "Bem vindo!")
]
