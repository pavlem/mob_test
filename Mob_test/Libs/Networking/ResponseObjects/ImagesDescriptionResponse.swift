//
//  ImagesDescriptionResponse.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 27.9.22..
//

import Foundation

struct ImagesDescriptionResponse: Decodable {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
    let photo: [ImageResponse]
}
