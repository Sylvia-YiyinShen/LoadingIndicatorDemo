//
//  ViewController.swift
//  LoadingIndicatorDemo
//
//  Created by Yiyin Shen on 18/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapShowButton(_ sender: Any) {
        view.showRotatingDotsIndicator()

//        view.showRotatingImageIndicator(with: CGSize(width: 60, height: 60))
    }

    @IBAction func didTapHideButton(_ sender: Any) {
        view.hideRotatingLoadingIndicator()
    }
}


