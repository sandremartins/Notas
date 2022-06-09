//
//  ContentView.swift
//  Notas
//
//  Created by Alessandre Martins on 6/8/22.
//

import SwiftUI

struct ContentView: View {
//    @ObservableObject var notasFactory: NotasFactory
    @StateObject var notasFactory: NotasFactory
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notasFactory.notas) { nota in
                    NotaCell(nota: nota)
                }
                .onDelete(perform: { indexSet in
                    notasFactory.notas.remove(atOffsets: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    notasFactory.notas.move(fromOffsets: indices, toOffset: newOffset)
                })
                
                Spacer()
                Text("\(notasFactory.notas.count) Notas")
                Spacer()
            }
            .navigationTitle("Notas")
            .toolbar {
                EditButton()
            }
        }
    }
}

struct NotaCell: View {
    var nota: Nota
    
    var body: some View {
        NavigationLink(destination: NotaDetalhe(nota: nota)) {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(notasFactory: testFactory)
    }
}
