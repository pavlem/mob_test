//
//  HistoryView.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 27.9.22..
//

import SwiftUI

struct HistoryView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let vm: HistoryVM
    
    private var searchHistoryArray: [String] { return vm.getAllSearchTerms()?.sorted() ?? [String]() }
    
    var body: some View {
        
        Text(vm.titleText)
            .font(.title)
            .padding()
        
        HStack {
            Button(vm.btnTitleResetText) {
                dismiss()
                vm.reset()
            }
            Spacer()
            Button(vm.btnTitleDismissText) {
                dismiss()
            }
        }
        .padding()
        List {
            ForEach(searchHistoryArray, id: \.self) { Text("\($0.capitalized)") }
        }
    }
}
