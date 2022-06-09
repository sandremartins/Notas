//
//  NotasFactory.swift
//  Notas
//
//  Created by Alessandre Martins on 6/9/22.
//

import Foundation
import FirebaseFirestore

class NotasFactory: ObservableObject {
    @Published var notas: [Nota]
    
    init( notas: [Nota] = []) {
        self.notas = notas
        let db = Firestore.firestore()
        db.collection("Notas").addSnapshotListener {(snap, err) in
            if err != nil {
                print("Error")
                return
            }
            for i in snap!.documentChanges {
//                let documentID = i.document.documentID
                let dbID = i.document.get("id") as! String
                let dbNotaText = i.document.get("notaText") as! String
                let dbLiked = i.document.get("liked") as! Bool
                if let notaID = UUID(uuidString: dbID) {
                    DispatchQueue.main.async {
                        self.notas.append(Nota(id: notaID, notaText: dbNotaText, liked: dbLiked))
                    }
                }
            }
        }
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
