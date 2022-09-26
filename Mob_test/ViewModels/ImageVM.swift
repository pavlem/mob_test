//
//  ImageVM.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 27.9.22..
//

import UIKit
import SwiftUI
import NetworkProvider

class ImageVM: Identifiable, ObservableObject {
    
    @Published var image: UIImage = UIImage(systemName: "photo")!
    let imageFrameWidth = CGFloat(150)
    let backgroundMinWidth = CGFloat(150)
    let backgroundMinHeight = CGFloat(250)
    let backgroundCornerRadius = CGFloat(10)
    
    let titleFont = Font.system(size: 12, weight: .regular, design: .default)   
    
    var imageCornerRadius: CGFloat { imageFrameWidth / 2 }
    var id: String { imageModel.id }
    var title: String { imageModel.title }
    
    init(imageModel: ImageModel, networkService: FlickrAPIProtocol = FlickrAPIService(), storage: Storable = UserDefaultsStorage()) {
        self.networkService = networkService
        self.storage = storage
        self.imageModel = imageModel
        
        self.fetchImage()
    }
    
    private let imageModel: ImageModel
    private let networkService: FlickrAPIProtocol
    private let storage: Storable
    
    // MARK: - Helper
    private func fetchImage() {
        if let image = imageModel.cachedImage {
            self.image = image
            return
        }
        
        imageModel.fetch { result in
            switch result {
            case .failure(let err):
                print(err) // Handle error, maybe as an alert
            case .success(let img):
                DispatchQueue.main.async {
                    self.imageModel.cache(image: img, key: self.imageModel.imageUrlString)
                    self.image = img
                }
            }
        }
    }
}
