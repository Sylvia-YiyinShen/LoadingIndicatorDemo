//
//  ViewController.swift
//  LoadingIndicatorDemo
//
//  Created by Yiyin Shen on 18/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var circleLoadingIndicator: CircleLoadingIndicator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapShowButton(_ sender: Any) {
        view.showCircleLoadingIndicator()
    }

    @IBAction func didTapHideButton(_ sender: Any) {
        view.hideCircleLoadingIndicator()
    }
}

