//
//  CategoryListView.swift
//  TodoApp
//
//  Created by SG on 1/21/25.
//

import SwiftUI
import SwiftData

struct CategoryListView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var categories: [Category]
    
    @State private var seletedCategory: Category?
    @State private var isEditingCategory = false
    @State private var editCategoryName: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(categories) { category in
                    HStack {
                        Text(category.name ?? "-")
                        Spacer()
                    }
                    .onLongPressGesture {
                        seletedCategory = category
                        editCategoryName = category.name ?? "-"
                        isEditingCategory = true
                        
                    }
                }
                .onDelete(perform: deleteCategories)
            }
            .navigationTitle("Categories")
            .alert("카테고리 수정", isPresented: $isEditingCategory
            ) {
                TextField("카테고리 이름", text: $editCategoryName)
                HStack {
                    Button("취소") {
                        editCategoryName = ""
                    }
                    Button("저장") {
                        if let category = seletedCategory, !editCategoryName.isEmpty {
                            category.name = editCategoryName
                            try? modelContext.save()
                        }
                    }
                }
            }
            message: {
                Text("카테고리 이름을 입력하세요.")
            }
        }
    }
    
    
    func deleteCategories(at offsets: IndexSet) {
        for index in offsets {
            let category = categories[index]
            modelContext.delete(category)
        }
    }
}

#Preview {
    CategoryListView()
        .modelContainer(PreviewContainer.shared.container)
}
