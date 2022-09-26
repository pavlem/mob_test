////
////  SearchDetailVM.swift
////  Mob_test
////
////  Created by Pavle Mijatovic on 28.9.22..
////
//
import SwiftUI


class SearchDetailVM: ObservableObject {
    
    // MARK: - API
    var model: SearchDetailModel
    
    var image: UIImage { model.cachedImage ?? UIImage(systemName: "photo")! }
    var cornerRadius: CGFloat { return imageFrameWidth / 2 }
    
    let mainTitle = "Details"
    let imageFrameWidth = CGFloat(300)
    let shadowRadius = CGFloat(50)
    let lineWidth = CGFloat(12)
    
    // MARK: - Inits
    init(searchDetailModel: SearchDetailModel) {
        self.model = searchDetailModel
    }
}
