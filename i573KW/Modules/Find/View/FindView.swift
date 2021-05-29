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
    lazy var mapButtonView = MapButtonView()
    
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
        
        mapButtonView.layer.shadowColor = UIColor.lightGray.cgColor
        mapButtonView.layer.shadowRadius = 11
        mapButtonView.layer.shadowOpacity = 0.2
        addSubview(mapButtonView)
    }
    
    private func prepare() {
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mapButtonView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(8)
            make.right.equalToSuperview().offset(-8)
        }
    }
    
    func update(buttonModels: [MapButtonModel]) {
        mapButtonView.update(models: buttonModels)
    }
}
