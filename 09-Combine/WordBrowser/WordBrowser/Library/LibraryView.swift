//
//  LibraryView.swift
//  WordBrowser
//
//  Created by NO SEONGGYEONG on 4/10/25.
//

import SwiftUI

struct LibraryView: View {
    @State var viewModel = LibraryViewModel()
    var body: some View {
        NavigationStack {
            List {
            
            }
        }
        .navigationTitle("라이브러리")
        
        
    }
}

#Preview {
    LibraryView()
}
