//
//  Created by Bojan on 28.4.24.
//

import SwiftUI

/// A custom view that displays a circular progress indicator.
struct ProgressIndicatorView: View {
    @State private var isLoading = false
    
    var tintColor: Color = .black
    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
            .foregroundColor(tintColor)
            .scaleEffect(CGSize(width: 1.5, height: 1.5))
            .onAppear {
                self.isLoading = true
            }
    }
}
