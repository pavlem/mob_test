//
//  FlickrAPIProtocol.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 26.9.22..
//

import UIKit
import NetworkProvider

protocol FlickrAPIProtocol {
    func getImages(forRequest imagesRequest: ImagesRequest, completion: @escaping (Result<[ImageResponse]?, NetworkError>) -> ())
    func fetch(imageWithRequest imageReq: ImageRequest, completion: @escaping (Result<UIImage, NetworkError>) -> ())
}
