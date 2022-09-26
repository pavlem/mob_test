//
//  ImageModel.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 27.9.22..
//

import UIKit
import NetworkProvider

struct ImageModel {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    private let networkService: FlickrAPIProtocol
    private let storage: Storable
}

extension ImageModel {
    
    // MARK: - API
    var imageRequest: ImageRequest { ImageRequest(farm: String(farm), server: server, id: id, secret: secret) }
    var imageUrlString: String { "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg" }
    
    func cache(image: UIImage, key: String) { ImageHelper.shared.imageCache.setObject(image, forKey: key as NSString) }
    
    var cachedImage: UIImage? {
        if let image = ImageHelper.shared.imageCache.object(forKey: imageUrlString as NSString) { return image }
        return nil
    }
    
    func fetch(completion: @escaping (Result<UIImage, NetworkError>) -> ()) {
        networkService.fetch(imageWithRequest: imageRequest) { result in
            completion(result)
        }
    }
    
    // MARK: - Inits
    init(imageResponse: ImageResponse, networkService: FlickrAPIProtocol = FlickrAPIService(), storage: Storable = UserDefaultsStorage()) {
        self.id = imageResponse.id
        self.owner = imageResponse.owner
        self.secret = imageResponse.secret
        self.server = imageResponse.server
        self.farm = imageResponse.farm
        self.title = imageResponse.title
        self.networkService = networkService
        self.storage = storage
    }
}
