//
//  SearchDetailModelTests.swift
//  Mob_testTests
//
//  Created by Pavle Mijatovic on 28.9.22..
//

import XCTest
@testable import Mob_test

class SearchDetailModelTests: XCTestCase {

    func testImageUrlString() throws {

        // given
        let imgResponse = ImageResponse(id: "52389113187", owner: "151639852@N07", secret: "872d0a584d", server: "65535", farm: 66, title: "2022-09-25_14-09-06_ILCE-7C_DSCDS9557", ispublic: 1, isfriend: 0, isfamily: 0)
        let searchDetailModel = SearchDetailModel(imageResponse: imgResponse)

        // when
        let imageUrlString = searchDetailModel.imageUrlString

        // then
        XCTAssert(imageUrlString == "https://farm66.static.flickr.com/65535/52389113187_872d0a584d.jpg")
    }
}
