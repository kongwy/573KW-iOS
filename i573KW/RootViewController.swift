//
//  RootViewController.swift
//  i573KW
//
//  Created by Weiyi Kong on 29/5/21.
//

import SPPermissions
import UIKit

class RootViewController: UITabBarController {
    var isLocationNotDetermined = SPPermissions.Permission.locationWhenInUse.notDetermined

    override func viewDidLoad() {
        super.viewDidLoad()

        let vcs = [
            UINavigationController(rootViewController: FindViewController()),
            UINavigationController(rootViewController: MoreViewController())
        ]

        vcs[0].tabBarItem.title = "Find"
        vcs[0].tabBarItem.image = UIImage(systemName: "map.fill")

        vcs[1].tabBarItem.title = "More"
        vcs[1].tabBarItem.image = UIImage(systemName: "rectangle.stack.person.crop.fill")

        viewControllers = vcs
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if isLocationNotDetermined { askForPermissions() }
    }

    func askForPermissions() {
        let permissions: [SPPermissions.Permission] = [.locationWhenInUse, .motion]
        let permissionsDialog = SPPermissions.dialog(permissions)
        permissionsDialog.present(on: self)
        isLocationNotDetermined = SPPermissions.Permission.locationWhenInUse.notDetermined
    }
}
