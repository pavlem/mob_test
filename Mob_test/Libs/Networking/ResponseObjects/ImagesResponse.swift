//
//  ImagesResponse.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 27.9.22..
//

import Foundation

struct ImagesResponse: Decodable {
    let photos: ImagesDescriptionResponse
    let stat: String
}
