//
//  ImagesModel.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 27.9.22..
//

import Foundation
import NetworkProvider

struct ImagesModel {
    
    // MARK: - API
    func getImages(forRequest imagesRequest: ImagesRequest, completion: @escaping (Result<[ImageResponse]?, NetworkError>) -> ()) {
        self.networkService.getImages(forRequest: imagesRequest) { result in
            completion(result)
        }
    }
    
    func save(searchQuery: String) {
        storageService.save(queryString: searchQuery)
    }
    
    // MARK: - Properties
    private let networkService: FlickrAPIProtocol
    private let storageService: Storable
    
    // MARK: - Inits
    init(networkService: FlickrAPIProtocol, storageService: Storable) {
        self.networkService = networkService
        self.storageService = storageService
    }
}
