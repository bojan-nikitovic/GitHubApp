//
//  Created by Bojan on 28.4.24.
//

import SwiftUI

extension View {
    func errorAlert(error: Binding<Error?>) -> some View {
        modifier(ErrorAlertModifier(error: error))
    }
}
