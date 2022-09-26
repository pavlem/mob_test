//
//  ImagesVM.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 27.9.22..
//

import UIKit
import NetworkProvider

struct ImagesVM {
    
    let model: ImagesModel
    
    let searchPlaceholderText = "Enter search text"
    let searchBtnTitle = "Search"
    let noEmptyStringText = "Please input something"
    let okAlertButtontext = "OK"
    let searchHistoryText = "History"
    let navTitleSearchingText = "Searching..."
    let navTitleSearchingDoneText = "Results"
    
    func getImages(_ searchText: String, page: Int = 1, completion: @escaping (Result<[ImageResponse]?, NetworkError>) -> ()) {
        let request = ImagesRequest(text: searchText.lowercased(), page: String(page))
        model.getImages(forRequest: request) { result in completion(result) }
    }
    
    func save(searchQuery: String) {
        model.save(searchQuery: searchQuery)
    }
}
