//
//  LaunchViewController.swift
//  Home Test Kitchen
//
//  Created by Isaac Sheets on 7/17/21.
//

import UIKit

class LaunchViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Launch"
    }
    required init?(coder: NSCoder) { nil }

    override func loadView() {
        self.view = LaunchView()
    }
}

