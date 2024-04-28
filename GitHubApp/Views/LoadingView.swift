//
//  Created by Bojan on 28.4.24.
//

import SwiftUI

/// A generic SwiftUI view wrapper that displays a loading indicator when data is loading and the content view when loading is complete.
/// This view takes any SwiftUI view as content and shows a progress indicator while loading.
struct LoadingView<Content: View>: View{
    @Binding var isLoading: Bool
    
    var tintColor: Color = .black
    
    let content: Content
    
    init(isLoading: Binding<Bool>, tintColor: Color = .black, @ViewBuilder builder: () -> Content) {
        self._isLoading = isLoading
        self.tintColor = tintColor
        content = builder()
    }
    
    var body: some View {
        ZStack {
            if isLoading {
                ProgressIndicatorView(tintColor: tintColor)
            } else {
                content.animation(nil, value: isLoading)
            }
        }
    }
}
