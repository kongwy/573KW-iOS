//
//  MapButtonModel.swift
//  i573KW
//
//  Created by Weiyi Kong on 29/5/21.
//

import Foundation

struct MapButtonModel {
    var image: UIImage?
    var tintColor: UIColor = UIColor { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .dark:
            return .white
        default:
            return .link
        }
    }
    var completionHandler: ((MapButtonModel) -> Void)?
    
    func didTapped() {
        if let completionHandler = completionHandler { completionHandler(self) }
    }
}
