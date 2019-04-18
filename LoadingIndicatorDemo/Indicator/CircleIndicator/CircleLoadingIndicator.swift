//
//  LoadingIndicator.swift
//  LoadingIndicatorDemo
//
//  Created by Yiyin Shen on 18/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation
import UIKit

enum RotateSpeed {
    case slow
    case medium
    case fast
}

class CircleLoadingIndicator: UIView {

    private var indicatorImageView: UIImageView?
    private var rotateAnimationKey = "rotateAnimationKey"
    private var rotateSpeed: RotateSpeed = .medium
    private lazy var rotateAnimation: CABasicAnimation = {
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.fromValue = 0.0
        rotation.toValue = Double.pi * 2
        switch rotateSpeed {
        case .slow:
                rotation.duration = 1.5
        case .medium:
            rotation.duration = 1.0
        case .fast:
            rotation.duration = 0.5
        }
        rotation.repeatCount = Float.greatestFiniteMagnitude
        return rotation
    }()

    init(speed: RotateSpeed = .medium) {
        super.init(frame: CGRect.zero)
        rotateSpeed = speed
        initialConfigure()
    }
    func initialConfigure() {
        isHidden = true

        let indicator = UIImageView(image: UIImage(named: "circle-indicator"))
        indicatorImageView = indicator
        addSubview(indicatorImageView!)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicator.topAnchor.constraint(equalTo: topAnchor),
            indicator.bottomAnchor.constraint(equalTo: bottomAnchor),
            indicator.leftAnchor.constraint(equalTo: leftAnchor),
            indicator.rightAnchor.constraint(equalTo: rightAnchor)])
    }

    func show() {
        isHidden = false
        indicatorImageView?.layer.add(rotateAnimation, forKey: rotateAnimationKey)
    }

    func hide() {
        isHidden = true
        indicatorImageView?.layer.removeAnimation(forKey: rotateAnimationKey)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
