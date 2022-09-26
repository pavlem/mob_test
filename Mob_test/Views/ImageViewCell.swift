//

//  Mob_test
//
//  Created by Pavle Mijatovic on 26.9.22..
//

import SwiftUI

struct ImageViewCell: View {
    
    @ObservedObject var vm: ImageVM
    
    var body: some View {
        VStack {
            ZStack {
                Color.teal
                    .frame(minWidth: vm.backgroundMinWidth, maxWidth: .infinity, minHeight: vm.backgroundMinHeight, maxHeight: .infinity)
                    .cornerRadius(vm.backgroundCornerRadius)
                VStack {
                    Image(uiImage: vm.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: vm.imageFrameWidth, height: vm.imageFrameWidth)
                        .clipped()
                        .cornerRadius(vm.imageCornerRadius)
                        .padding()
                    Spacer()
                }
                VStack {
                    Spacer()
                    Text(vm.title)
                        .font(vm.titleFont)
                        .lineLimit(3)
                        .padding()
                    
                }
            }
        }
    }
}
