//
//  ContentView.swift
//  Notas
//
//  Created by Alessandre Martins on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    @State var notas:[Nota] = testData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notas.indices) { idx in
                    NotaCell(nota: $notas[idx])
                }
                Spacer()
                Text("\(notas.count) Notas")
                Spacer()
            }
            .navigationTitle("Notas")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NotaCell: View {
    @Binding var nota: Nota
    
    var body: some View {
        NavigationLink(destination: NotaDetalhe(nota: $nota)) {
            HStack {
                Image(systemName: nota.liked ? "heart.fill" : "heart")
                    .foregroundColor(.red)
                    .padding(.all)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(nota.notaText)
                    .font(.title)
                    .padding(.vertical)
            }
        }
    }
}
