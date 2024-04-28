//
//  Created by Bojan on 28.4.24.
//

import UIKit

class Appearance {
    /// Configures global appearance for the application.
    static func configure() {
        configureNavigationBar()
    }
    
    /// Sets up the navigation bar's appearance across the app.
    static func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
