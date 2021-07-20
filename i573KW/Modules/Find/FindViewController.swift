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
    var isLocationAuthorized = SPPermissions.Permission.locationWhenInUse.authorized

    lazy var contentView = FindView()
    lazy var mapButtons = [
        MapButtonModel(image: UIImage(systemName: "list.bullet"), completionHandler: nil),
        MapButtonModel(image: UIImage(systemName: "location"), completionHandler: { _ in
            self.locateButtonDidTapped()
        })
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        title = "Find"
        view.addSubview(contentView)

        contentView.mapView.delegate = self
        contentView.update(userInterfaceStyle: traitCollection.userInterfaceStyle)
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

// MARK: - MapView Support

extension FindViewController: MAMapViewDelegate {
    func mapView(_ mapView: MAMapView!, mapWillZoomByUser wasUserAction: Bool) {
        mapView.scaleOrigin = CGPoint(x: 8, y: tabBarController!.tabBar.frame.origin.y - 28)
        mapView.showsScale = true
    }

    func mapView(_ mapView: MAMapView!, mapDidZoomByUser wasUserAction: Bool) {
        mapView.showsScale = false
    }

    func mapView(_ mapView: MAMapView!, mapWillMoveByUser wasUserAction: Bool) {
        contentView.mapButtonGroupView.buttonViews[1].imageView.image = UIImage(systemName: "location")
    }
}

extension FindViewController {
    func locateButtonDidTapped() {
        let userLocation = contentView.mapView.userLocation.coordinate
        let span = MACoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MACoordinateRegion(center: userLocation, span: span)
        contentView.mapView.setRegion(region, animated: true)
        contentView.mapButtonGroupView.buttonViews[1].imageView.image = UIImage(systemName: "location.fill")
    }
}
