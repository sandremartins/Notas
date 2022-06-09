//
//  NotaDetalhe.swift
//  Notas
//
//  Created by Alessandre Martins on 6/8/22.
//

import SwiftUI

struct NotaDetalhe: View {
    var nota: Nota
//    @ObservableObject var notasFactory = testFactory
    @StateObject var notasFactory = testFactory
    
    var body: some View {
        let notaIdx = notasFactory.index(of: nota)
        VStack {
            Text(notasFactory.notas[notaIdx].notaText)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Image(systemName: notasFactory.notas[notaIdx].liked ? "heart.fill" : "heart")
                .foregroundColor(.red)
                .padding(.all)
                .onTapGesture {
                    notasFactory.notas[notaIdx].liked.toggle()
                }
        }
        .font(.largeTitle)
    }
}

struct NotaDetalhe_Previews: PreviewProvider {
    static var previews: some View {
        NotaDetalhe(nota: testFactory.notas[0])
    }
}
