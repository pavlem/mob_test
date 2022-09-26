//
//  ImagesRequest.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 27.9.22..
//

import Foundation
import NetworkProvider

struct ImagesRequest {
    let method: String = "flickr.photos.search"
    let apiKey: String = "7cc2262320610595b27ddf9fd4d09ef6"
    let text: String
    let perPage: String = "20"
    let format: String = "json"
    let page: String?
    let nojsoncallback = "1"
}

extension ImagesRequest {
    
    func body() -> NetworkService.JSON {
        var params: [String: Any] = [
            "method": method,
            "api_key": apiKey,
            "text": text,
            "per_page": perPage,
            "format": format,
            "nojsoncallback": nojsoncallback
        ]
        
        if let page = self.page {
            params["page"] = page
        }
        
        return params
    }
}
