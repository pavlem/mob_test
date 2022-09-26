//
//  FlickrAPIService.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 26.9.22..
//

import UIKit
import NetworkProvider

class FlickrAPIService: FlickrAPIProtocol {
    
    func fetch(imageWithRequest imageReq: ImageRequest, completion: @escaping (Result<UIImage, NetworkError>) -> ()) {

        let urlString = "\(scheme)farm\(imageReq.farm).static.flickr.com/\(imageReq.server)/\(imageReq.id)_\(imageReq.secret).jpg"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(.failure(NetworkError.error(err: err)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.unknown))
                return
            }
            
            guard let img = UIImage(data: data) else {
                completion(.failure(.unknown))
                return
            }
            
            completion(.success(img))
        }
        task.resume()
    }
        
    func getImages(forRequest imagesRequest: ImagesRequest, completion: @escaping (Result<[ImageResponse]?, NetworkError>) -> ()) {
        _ = ns.load(urlString: urlString, path: path, method: .get, params: imagesRequest.body(), headers: nil) { (result: Result<ImagesResponse?, NetworkError>) in

            switch result {
            case .success(let imagesResponse):
                completion(.success(imagesResponse?.photos.photo))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    // MARK: - Properties
    private let scheme = "https://"
    private let host = "api.flickr.com/"
    private let path = "services/rest/"

    private var urlString: String { return scheme + host }
    
    private var ns = NetworkService()
}
