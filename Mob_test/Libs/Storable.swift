//
//  Storable.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 27.9.22..
//

import Foundation

protocol Storable {
    func save(queryString: String)
    func getAllSearchTerms() -> [String]?
    func reset()
}

