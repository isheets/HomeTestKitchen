//
//  HomeViewController.swift
//  Home Test Kitchen
//
//  Created by Isaac Sheets on 7/17/21.
//

import UIKit

class HomeViewController: UIViewController {

    init(coord: Coordinator, repo: Repo) {
        self.coord = coord
        self.repo = repo
        super.init(nibName: nil, bundle: nil)
        title = "Home Test Kitchen"
    }
    required init?(coder: NSCoder) { nil }

    override func loadView() {
        view = HomeView()
    }

    private let coord: Coordinator
    private let repo: Repo
}
