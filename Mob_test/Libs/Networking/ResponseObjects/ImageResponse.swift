//
//  ImageResponse.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 27.9.22..
//

import Foundation

struct ImageResponse: Decodable, Identifiable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    let ispublic: Int?
    let isfriend: Int?
    let isfamily: Int?
}

extension ImageResponse {
    init() {
        id = ""
        owner = ""
        secret = ""
        server = ""
        farm = 0
        title = ""
        ispublic = nil
        isfriend = nil
        isfamily = nil
    }
}
