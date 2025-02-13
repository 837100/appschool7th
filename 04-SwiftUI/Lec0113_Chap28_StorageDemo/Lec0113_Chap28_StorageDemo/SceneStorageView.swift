//
//  SceneStorageView.swift
//  Lec0113_Chap28_StorageDemo
//
//  Created by SG on 1/13/25.
//

import SwiftUI

struct SceneStorageView: View {
    @SceneStorage("mytext") private var editorText = ""
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    SceneStorageView()
}
