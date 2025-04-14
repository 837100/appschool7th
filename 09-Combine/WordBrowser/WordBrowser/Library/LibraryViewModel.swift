//
//  LibraryViewModel.swift
//  WordBrowser
//
//  Created by NO SEONGGYEONG on 4/10/25.
//

import SwiftUI

@Observable
class LibraryViewModel {
    var randomWord: Word?
    var isRefreshing: Bool = false
    var refreshyError: String? = nil
        
    func refresh(initalLoad: Bool = false) async {
        
        
    }
}
