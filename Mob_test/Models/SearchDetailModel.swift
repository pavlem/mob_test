//
//  SearchDetailModel.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 28.9.22..
//

import UIKit

struct SearchDetailModel {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
}

extension SearchDetailModel {
    var imageUrlString: String { "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg" }
    
    var cachedImage: UIImage? {
        if let image = ImageHelper.shared.imageCache.object(forKey: imageUrlString as NSString) { return image }
        return nil
    }
    
    init(imageResponse: ImageResponse) {
        self.id = imageResponse.id
        self.owner = imageResponse.owner
        self.secret = imageResponse.secret
        self.server = imageResponse.server
        self.farm = imageResponse.farm
        self.title = imageResponse.title
    }
}
