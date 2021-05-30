//
//  MapButtonView.swift
//  i573KW
//
//  Created by Weiyi Kong on 30/5/21.
//

import UIKit

class MapButtonView: UIView {
    lazy var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        prepare()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(model: MapButtonModel) {
        self.init()
        update(model: model)
    }

    func setup() {
        addSubview(imageView)
    }

    func prepare() {
        imageView.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.center.equalToSuperview()
        }
    }

    func update(model: MapButtonModel) {
        imageView.image = model.image
        imageView.tintColor = model.tintColor
        addTapGestureRecognizer { model.didTapped() }
    }
}
