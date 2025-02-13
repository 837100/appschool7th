//
//  AppStorageView.swift
//  Lec0113_Chap28_StorageDemo
//
//  Created by SG on 1/13/25.
//

import SwiftUI



struct UserName: Codable {
    var firstName: String
    var secondName: String
}


struct AppStorageView: View {
    @AppStorage("mytext") var editorText: String = "Sample Text"

    var body: some View {

        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    AppStorageView()
}
