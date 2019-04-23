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

    private var rotatingLoadingIndicator: RotatingLoadingIndicator? {
        get {
            return objc_getAssociatedObject(self, &circleLoadingIndicatorAssociationKey) as? RotatingLoadingIndicator
        }
        set {
            objc_setAssociatedObject(self, &circleLoadingIndicatorAssociationKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func showRotatingImageIndicator(with size: CGSize = CGSize(width: 40, height: 40) ,speed: RotateSpeed = .medium) {
        guard rotatingLoadingIndicator == nil else { return }
        let circleIndicator = RotatingLoadingIndicator(useImage: true, rotateSpeed: speed)
        circleIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(circleIndicator)
        NSLayoutConstraint.activate([
            circleIndicator.widthAnchor.constraint(equalToConstant: size.width),
            circleIndicator.heightAnchor.constraint(equalToConstant: size.width),
            circleIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)])
        rotatingLoadingIndicator = circleIndicator
        rotatingLoadingIndicator?.show()
    }

    func showRotatingDotsIndicator(with size: CGSize = CGSize(width: 40, height: 40) ,speed: RotateSpeed = .medium) {
        guard rotatingLoadingIndicator == nil else { return }
        let circleIndicator = RotatingLoadingIndicator(color: UIColor.gray, rotateSpeed: speed)
        circleIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(circleIndicator)
        NSLayoutConstraint.activate([
            circleIndicator.widthAnchor.constraint(equalToConstant: size.width),
            circleIndicator.heightAnchor.constraint(equalToConstant: size.width),
            circleIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)])
        rotatingLoadingIndicator = circleIndicator
        rotatingLoadingIndicator?.show()
    }

    func hideRotatingLoadingIndicator() {
        rotatingLoadingIndicator?.hide()
        rotatingLoadingIndicator?.removeFromSuperview()
        rotatingLoadingIndicator = nil
    }
}
