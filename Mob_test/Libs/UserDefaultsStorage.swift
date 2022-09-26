//
//  UserDefaultsStorage.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 27.9.22..
//

import Foundation

class UserDefaultsStorage: Storable {
    
    func reset() { UserDefaults.standard.reset() }
    
    func save(queryString: String) {
        guard let searchTerms = getAllSearchTerms() else {
            userDefaults.set([queryString], forKey: UserDefaults.queryKey)
            return
        }
        
        if (searchTerms.filter { queryString == $0 }).count > 0 { return }
        
        userDefaults.set(searchTerms + [queryString], forKey: UserDefaults.queryKey)
    }
    
    func getAllSearchTerms() -> [String]? {
        let strings = userDefaults.object(forKey: UserDefaults.queryKey) as? [String]
        return strings
    }
    
    private let userDefaults = UserDefaults.standard
}

extension UserDefaults {
    enum Keys: String, CaseIterable { case queryString }
    
    func reset() { Keys.allCases.forEach { removeObject(forKey: $0.rawValue) } }
    
    static var queryKey: String { UserDefaults.Keys.queryString.rawValue }
}
