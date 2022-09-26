//
//  ContentView.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 26.9.22..
//

import SwiftUI
import NetworkProvider
import Combine


struct ImagesView: View {
    
    let vm = ImagesVM(model: ImagesModel(networkService: FlickrAPIService(), storageService: UserDefaultsStorage()))
    
    @State private var isLoading = false
    @State var images: [ImageResponse] = [ImageResponse]()
    @State var tappedImage: ImageResponse = ImageResponse()
    @State var searchText: String = ""
    @State private var isShowingAlert = false
    @State var isRequestOngoing = false
    @State private var showingSheet = false
    @State var wholeSize: CGSize = .zero
    @State var scrollViewSize: CGSize = .zero
    @State private var isLinkActive = false
    
    private var nextPage: Int { self.images.count / 20 + 1 }
    private var isBottomReached: Int { self.images.count / 20 + 1 }

    private var twoColumnGrid: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            LoadingView(isShowing: $isLoading) {
                VStack {
                    NavigationLink(destination: SearchDetailView(vm: SearchDetailVM(searchDetailModel: SearchDetailModel(imageResponse: tappedImage))), isActive: $isLinkActive) { }
                        .navigationTitle($isLoading.wrappedValue ? vm.navTitleSearchingText : vm.navTitleSearchingDoneText)
                    
                    HStack {
                        TextField(vm.searchPlaceholderText, text: $searchText)
                        Spacer()
                        Button {
                            guard searchText.isEmpty == false else {
                                isShowingAlert = true
                                return
                            }
                            
                            isLoading = true
                            vm.save(searchQuery: searchText.lowercased())
                            
                            vm.getImages(searchText) { result in
                                DispatchQueue.main.async {
                                    switch result {
                                    case .success(let images):
                                        self.isLoading = false
                                        self.images = images!
                                    case .failure(_):
                                        self.isLoading = false
                                        
                                    }
                                }
                            }
                            
                        } label: {
                            Text(vm.searchBtnTitle)
                        }
                        .alert(vm.noEmptyStringText, isPresented: $isShowingAlert) {
                            Button(vm.okAlertButtontext, role: .cancel) {
                                isShowingAlert = false
                            }
                        }
                        Button(vm.searchHistoryText) {
                            showingSheet.toggle()
                        }
                        .sheet(isPresented: $showingSheet) {
                            HistoryView(vm: HistoryVM(model: HistoryModel(storage: UserDefaultsStorage())))
                        }
                    }
                    .padding()
                    
                    ChildSizeReader(size: $wholeSize) {
                        ScrollView {
                            ChildSizeReader(size: $scrollViewSize) {
                                
                                LazyVGrid(columns: twoColumnGrid, spacing: 16) {
                                    ForEach(images) { imageResponse in
                                        ImageViewCell(vm: ImageVM(imageModel: ImageModel(imageResponse: imageResponse)))
                                            .onTapGesture {
                                                print(imageResponse)
                                                tappedImage = imageResponse
                                                isLinkActive = true
                                            }
                                    }
                                }
                                .padding()
                                .background(
                                    GeometryReader { proxy in
                                        Color.clear.preference(
                                            key: ViewOffsetKey.self,
                                            value: -1 * proxy.frame(in: .named("scroll")).origin.y
                                        )
                                    }
                                )
                                .onPreferenceChange(
                                    ViewOffsetKey.self,
                                    perform: { value in
                                        
                                        if value >= scrollViewSize.height - wholeSize.height {
                                            
                                            guard searchText.isEmpty == false else { return }
                                            guard isRequestOngoing == false else { return }
                                            isRequestOngoing = true
                                            
                                            vm.getImages(searchText, page: nextPage) { result in
                                                DispatchQueue.main.async {
                                                    switch result {
                                                    case .success(let images):
                                                        self.isLoading = false
                                                        self.isRequestOngoing = false
                                                        self.images.append(contentsOf: images!)
                                                    case .failure(_):
                                                        self.isRequestOngoing = false
                                                        self.isLoading = false
                                                    }
                                                }
                                            }
                                            print("Bottom of the ScrollView.")
                                        } else {
                                            print("Not reached the bottom of the ScrollView")
                                        }
                                    }
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}
