//
//  SearchDetailView.swift
//  Mob_test
//
//  Created by Pavle Mijatovic on 28.9.22..
//

import SwiftUI

struct SearchDetailView: View {
    
    var vm: SearchDetailVM
    
    var body: some View {
        
        ZStack {
            Color.teal
                .ignoresSafeArea()
            VStack {
                NavigationLink(destination: SearchImageLargeView(uiImage: vm.image)) {
                    Image(uiImage: vm.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: vm.imageFrameWidth, height: vm.imageFrameWidth)
                        .clipped()
                        .cornerRadius(vm.cornerRadius)
                        .shadow(radius: vm.shadowRadius)
                        .padding(.bottom)
                }
                Text(vm.model.title)
                    .font(Font.largeTitle.weight(.bold))
            }
            .padding().navigationBarTitle(Text(vm.mainTitle), displayMode: .inline)
        }
    }
}
