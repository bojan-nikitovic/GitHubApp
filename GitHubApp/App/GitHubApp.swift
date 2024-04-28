//
//  Created by Bojan on 28.4.24.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        Appearance.configure()
        
        return true
    }
}

@main
struct GitHubApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                UserDetailsView()
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
