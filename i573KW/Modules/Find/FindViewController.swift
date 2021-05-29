//
//  FindViewController.swift
//  i573KW
//
//  Created by Weiyi Kong on 29/5/21.
//

import AMapFoundationKit
import SnapKit
import SPPermissions
import UIKit

class FindViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    lazy var contentView = FindView()

    var isLocationAuthorized = SPPermissions.Permission.locationWhenInUse.authorized
    let mapButtons = [
        MapButtonModel(image: UIImage(systemName: "list.bullet"), completionHandler: nil),
        MapButtonModel(image: UIImage(systemName: "location"), completionHandler: nil)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        title = "Find"
        view.addSubview(contentView)

        contentView.mapView.delegate = self
        contentView.update(buttonModels: mapButtons)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.isNavigationBarHidden = false
    }
}

extension FindViewController: MAMapViewDelegate {
    func mapView(_ mapView: MAMapView!, mapWillZoomByUser wasUserAction: Bool) {
        mapView.scaleOrigin = CGPoint(x: 8, y: tabBarController!.tabBar.frame.origin.y - 28)
        mapView.showsScale = true
    }

    func mapView(_ mapView: MAMapView!, mapDidZoomByUser wasUserAction: Bool) {
        mapView.showsScale = false
    }
}
