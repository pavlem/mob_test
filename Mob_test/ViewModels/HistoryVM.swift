//
//  HistoryVM.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 27.9.22..
//

import Foundation

struct HistoryVM {
    
    let titleText = "History"
    let btnTitleResetText = "Reset"
    let btnTitleDismissText = "Dismiss"

    func getAllSearchTerms() -> [String]? { model.getAllSearchTerms() }
    func reset() { model.reset() }

    private let model: HistoryModel
    
    init(model: HistoryModel) {
        self.model = model
    }
}
