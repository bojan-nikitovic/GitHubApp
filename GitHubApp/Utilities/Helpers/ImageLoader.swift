//
//  Created by Bojan on 28.4.24.
//

import Foundation
import SwiftUI
import Combine

/// An observable object class that loads and holds image data.
class ImageLoader: ObservableObject {
    @Published var imageData: Data?
    
    /// Loads image data from a given URL string.
    /// - Parameter url: A string representing the URL from which to load the image.
    func loadImage(with url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                self.imageData = data
            }
        }.resume()
    }
}
