//
//  OnDemandBookListViewCombine.swift
//  CombineFirebaseBookShelf
//
//  Created by NO SEONGGYEONG on 4/9/25.
//

import Combine
import SwiftUI
import FirebaseFirestore

private class BookListViewModel: ObservableObject {
    @Published var books: [Book] = []
    @Published var errorMessage: String?
    
    private var db = Firestore.firestore()
    
    init() {
        db.collection("books").snapshotPublisher()
        // Firestore의 collectionReference를 사용하여 firesotre의 collection을 가져온다.
            .tryMap { querySnapshot in
                try querySnapshot.documents.compactMap { documentSnapshot in
                    try documentSnapshot.data(as: Book.self)
                }
            }
            .catch { error in
                self.errorMessage = error.localizedDescription
                return Just([Book]()).eraseToAnyPublisher()
            }
            .replaceError(with: [Book]())
            .assign(to: &$books)
    }
}
struct OnDemandBookListViewCombine: View {
    @StateObject private var viewModel = BookListViewModel()
    
    var body: some View {
        List(viewModel.books) { book in
            Text(book.title)
        }
        .navigationTitle("Book List")
    }
}
