//
//  UIViewExtensions.swift
//  i573KW
//
//  Created by Weiyi Kong on 29/5/21.
//

import UIKit

extension UIView {
    /// Remove all subviews.
    func removeSubviews() {
        for view in subviews { view.removeFromSuperview() }
    }
}

// MARK: - Add Gesture Recognizer with Closuer

public extension UIView {
    func addTapGestureRecognizer(action: (() -> Void)?) {
        tapAction = action
        isUserInteractionEnabled = true
        let selector = #selector(handleTap)
        let recognizer = UITapGestureRecognizer(target: self, action: selector)
        addGestureRecognizer(recognizer)
    }
}

private extension UIView {
    typealias Action = (() -> Void)

    enum Key { static var id = "tapAction" }

    var tapAction: Action? {
        get {
            return objc_getAssociatedObject(self, &Key.id) as? Action
        }
        set {
            guard let value = newValue else { return }
            let policy = objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
            objc_setAssociatedObject(self, &Key.id, value, policy)
        }
    }

    @objc func handleTap(sender: UITapGestureRecognizer) {
        tapAction?()
    }
}
