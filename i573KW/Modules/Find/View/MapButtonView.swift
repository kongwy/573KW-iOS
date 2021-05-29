//
//  MapButtonView.swift
//  i573KW
//
//  Created by Weiyi Kong on 29/5/21.
//

import SnapKit
import UIKit

class MapButtonView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        layer.cornerRadius = 8
        layer.cornerCurve = .continuous
        backgroundColor = .tertiarySystemBackground.withAlphaComponent(0.95)
    }
    
    func update(models: [MapButtonModel]) {
        removeSubviews()
        snp.makeConstraints { make in
            make.width.equalTo(44)
        }
        
        var buttons = [UIView]()
        for model in models {
            let singleButtonView = UIView()
            
            let imageView = UIImageView(image: model.image)
            imageView.tintColor = model.tintColor
            singleButtonView.addSubview(imageView)
            
            imageView.snp.makeConstraints { make in
                make.size.equalTo(24)
                make.center.equalToSuperview()
            }
            
            singleButtonView.addTapGestureRecognizer { model.didTapped() }
            
            buttons.append(singleButtonView)
        }
        
        for (index, button) in buttons.enumerated() {
            addSubview(button)
            button.snp.makeConstraints { make in
                make.height.equalTo(44)
                make.left.right.equalToSuperview()
            }
            
            if index == 0 {
                button.snp.makeConstraints { make in
                    make.top.equalToSuperview()
                }
            } else {
                let separator = UIView()
                separator.backgroundColor = .separator
                addSubview(separator)
                
                separator.snp.makeConstraints { make in
                    make.height.equalTo(1)
                    make.top.equalTo(buttons[index - 1].snp.bottom)
                    make.left.right.equalToSuperview()
                }
                
                button.snp.makeConstraints { make in
                    make.top.equalTo(separator.snp.bottom)
                }
            }
            if index == buttons.count - 1 {
                button.snp.makeConstraints { make in
                    make.bottom.equalToSuperview()
                }
            }
        }
    }
}
