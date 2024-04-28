//
//  Created by Bojan on 28.4.24.
//

import SwiftUI

/// A SwiftUI view wrapper that conditionally displays content based on the presence of an optional value.
///
/// Generics:
///   - Value: The type of the value that is being conditionally unwrapped.
///   - Content: The type of the view to display if the optional value is not nil, conforming to the `View` protocol.
struct Unwrap<Value, Content: View>: View {
    private let value: Value?
    private let content: (Value) -> Content
    
    init(_ value: Value?, @ViewBuilder content: @escaping (Value) -> Content) {
        self.value = value
        self.content = content
    }
    
    var body: some View {
        value.map(content)
    }
}
