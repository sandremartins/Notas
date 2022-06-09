//
//  NotaDetalhe.swift
//  Notas
//
//  Created by Alessandre Martins on 6/8/22.
//

import SwiftUI

struct NotaDetalhe: View {
    @Binding var nota: Nota
    
    var body: some View {
        VStack {
            Text(nota.notaText)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Image(systemName: nota.liked ? "heart.fill" : "heart")
                .foregroundColor(.red)
                .padding(.all)
                .onTapGesture {
                    nota.liked.toggle()
                }
        }
        .font(.largeTitle)
    }
}

struct NotaDetalhe_Previews: PreviewProvider {
    static var previews: some View {
        NotaDetalhe(nota: .constant(testData[0]))
    }
}
