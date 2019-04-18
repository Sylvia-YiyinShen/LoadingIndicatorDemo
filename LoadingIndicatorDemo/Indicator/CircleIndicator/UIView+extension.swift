//
//  UIView+extension.swift
//  LoadingIndicatorDemo
//
//  Created by Yiyin Shen on 18/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation
import UIKit


private var circleLoadingIndicatorAssociationKey = 0

extension UIView {

    private var circleLoadingIndicator: CircleLoadingIndicator? {
        get {
            return objc_getAssociatedObject(self, &circleLoadingIndicatorAssociationKey) as? CircleLoadingIndicator
        }
        set {
            objc_setAssociatedObject(self, &circleLoadingIndicatorAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func showCircleLoadingIndicator(speed: RotateSpeed = .medium) {
        let circleIndicator = CircleLoadingIndicator(speed: speed)
        circleIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(circleIndicator)
        NSLayoutConstraint.activate([
            circleIndicator.widthAnchor.constraint(equalToConstant: 60),
            circleIndicator.heightAnchor.constraint(equalToConstant: 60),
            circleIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)])
        circleLoadingIndicator = circleIndicator
        circleLoadingIndicator?.show()
    }

    func hideCircleLoadingIndicator() {
        circleLoadingIndicator?.hide()
        circleLoadingIndicator?.removeFromSuperview()
        circleLoadingIndicator = nil
    }
}
