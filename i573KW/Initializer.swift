//
//  Initializer.swift
//  i573KW
//
//  Created by Weiyi Kong on 28/5/21.
//

import AMapFoundationKit
import Foundation

class Initializer {
    class func initialize() {
        AMapServices.shared().enableHTTPS = true
        AMapServices.shared().apiKey = ""
    }
}
