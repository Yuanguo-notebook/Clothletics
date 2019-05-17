

import Foundation

extension Bundle {

    
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
