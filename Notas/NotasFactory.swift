//
//  NotasFactory.swift
//  Notas
//
//  Created by Alessandre Martins on 6/9/22.
//

import Foundation

class NotasFactory: ObservableObject {
    @Published var notas: [Nota]
    
    init( notas: [Nota] = []) {
        self.notas = notas
    }
    
    func index(of nota: Nota) -> Int {
        for index in 0..<self.notas.count {
            if self.notas[index].id == nota.id {
                return index
            }
        }
        return 0
    }
}

let testFactory = NotasFactory(notas: testData)
