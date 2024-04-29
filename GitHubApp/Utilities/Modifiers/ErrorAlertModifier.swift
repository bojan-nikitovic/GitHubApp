//
//  Created by Bojan on 28.4.24.
//

import SwiftUI

/// A custom view modifier to present an error alert over any content view when an error occurs.
struct ErrorAlertModifier: ViewModifier {
    @Binding var error: Error?
    
    func body(content: Content) -> some View {
        content
            .alert("", isPresented: Binding(get: {
                error != nil
            }, set: { newValue in
                error = newValue as? any Error
            })) {
                Button("general.ok".localized, role: .cancel) {}
            } message: {
                Text(error?.localizedDescription ?? "")
            }
    }
}
