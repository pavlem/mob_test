//
//  HistoryModel.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 28.9.22..
//

import Foundation

struct HistoryModel {
    func getAllSearchTerms() -> [String]? { storage.getAllSearchTerms() }
    func reset() { storage.reset() }

    private let storage: Storable

    init(storage: Storable) {
        self.storage = storage
    }
}
