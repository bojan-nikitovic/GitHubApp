//
//  Created by Bojan on 28.4.24.
//

import SwiftUI

/// A view that asynchronously loads and displays an image from a URL.
struct ImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    
    let url: String
    
    var body: some View {
        VStack {
            if let imageData = imageLoader.imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressIndicatorView()
            }
        }
        .onAppear {
            imageLoader.loadImage(with: url)
        }
    }
}
