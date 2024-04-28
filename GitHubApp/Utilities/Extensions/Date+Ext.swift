//
//  Created by Bojan on 28.4.24.
//

import Foundation

extension Date {
    func string(dateStyle: DateFormatter.Style = .none, timeStyle: DateFormatter.Style = .none) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle
        
        return dateFormatter.string(from: self)
    }
}
