//
//  ContentView.swift
//  Notas
//
//  Created by Alessandre Martins on 6/8/22.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
//    @ObservableObject var notasFactory: NotasFactory
    @StateObject var notasFactory: NotasFactory
    @State var showAdd = false
    @State var notaTextField: String = ""
    
    var body: some View {
        VStack {
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
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button("Add", action: newNota)
                    }
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    
                }
            }
            if showAdd {
                HStack {
                    TextField("Digite uma nova notação aqui.", text: $notaTextField)
                    Button("Save Nota", action: saveNota)
                }
                .padding(.all)
                .frame(height: 100)
            }
        }
    }
    
    func newNota() {
        showAdd = true
    }
    
    func saveNota() {
        let db = Firestore.firestore()
        let id = UUID().uuidString
        db.collection("Notas").document().setData(["id": id, "notaText":notaTextField, "liked":false])
        
        showAdd = false
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
