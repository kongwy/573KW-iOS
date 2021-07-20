//
//  FindView.swift
//  i573KW
//
//  Created by Weiyi Kong on 29/5/21.
//

import AMapFoundationKit
import SnapKit
import UIKit

class FindView: UIView {
    lazy var mapView = MAMapView()
    lazy var mapButtonGroupView = MapButtonGroupView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        prepare()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        mapView.showsCompass = false
        mapView.showsScale = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        // FIXME: HeadingIndicator cannot work.
        let userLoaction = MAUserLocationRepresentation()
        userLoaction.showsHeadingIndicator = true
        mapView.update(userLoaction)
        mapView.isShowsIndoorMap = true
        addSubview(mapView)
        
        mapButtonGroupView.layer.shadowColor = UIColor.darkGray.cgColor
        mapButtonGroupView.layer.shadowRadius = 16
        mapButtonGroupView.layer.shadowOpacity = 0.3
        addSubview(mapButtonGroupView)
    }
    
    private func prepare() {
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mapButtonGroupView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(8)
            make.right.equalToSuperview().offset(-8)
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            update(userInterfaceStyle: traitCollection.userInterfaceStyle)
        }
    }

    func update(userInterfaceStyle: UIUserInterfaceStyle) {
        switch userInterfaceStyle {
        case .dark:
            mapView.mapType = .standardNight
        default:
            mapView.mapType = .standard
        }
    }

    func update(buttonModels: [MapButtonModel]) {
        mapButtonGroupView.update(models: buttonModels)
        mapButtonGroupView.setNeedsLayout()
    }
}
