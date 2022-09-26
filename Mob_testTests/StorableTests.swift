//
//  StorableTests.swift
//  Mob_testTests
//
//  Created by Pavle Mijatovic on 28.9.22..
//

import XCTest
@testable import Mob_test

class StorableTests: XCTestCase {
    
    func testSaveQueryString() throws {
        // given
        let storableMOC = StorableMOC()
        XCTAssert(storableMOC.searchedTerms.isEmpty == true)

        // when
        storableMOC.save(queryString: "1")
        // then
        XCTAssert(storableMOC.searchedTerms.isEmpty == false)
    }
    
    func testSaveMultipleQueryStrings() throws {
        // given
        let storableMOC = StorableMOC()
        XCTAssert(storableMOC.searchedTerms.isEmpty == true)

        // when
        storableMOC.save(queryString: "1")
        storableMOC.save(queryString: "2")
        storableMOC.save(queryString: "3")

        // then
        XCTAssert(storableMOC.searchedTerms.count == 3)
    }
    
    func testResetSavedQueryStrings() throws {
        // given
        let storableMOC = StorableMOC()
        XCTAssert(storableMOC.searchedTerms.isEmpty == true)

        // when
        storableMOC.save(queryString: "1")
        storableMOC.save(queryString: "2")
        storableMOC.save(queryString: "3")
        storableMOC.reset()

        // then
        XCTAssert(storableMOC.searchedTerms.isEmpty == true)
    }
    
    func testFetchSavedQueryStrings() throws {
        // given
        let storableMOC = StorableMOC()
        XCTAssert(storableMOC.searchedTerms.isEmpty == true)

        // when
        storableMOC.save(queryString: "1")
        storableMOC.save(queryString: "2")
        storableMOC.save(queryString: "3")

        // then
        XCTAssert(storableMOC.getAllSearchTerms()!.count == 3)
    }
}

private class StorableMOC: Storable {
    
    var searchedTerms = [String]()
    
    func save(queryString: String) {
        searchedTerms.append(queryString)
    }
    
    func getAllSearchTerms() -> [String]? {
        return searchedTerms
    }
    
    func reset() {
        searchedTerms = [String]()
    }
}
