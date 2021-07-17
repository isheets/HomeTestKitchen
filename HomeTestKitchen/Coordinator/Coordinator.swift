//
//  Coordinator.swift
//  Home Test Kitchen
//
//  Created by Isaac Sheets on 7/17/21.
//

import UIKit

class Coordinator {
    private var window: UIWindow
    private var currentViewController: UIViewController

    init(window: UIWindow) {
        self.window = window
        currentViewController = LaunchViewController()
        window.rootViewController = currentViewController
        window.makeKeyAndVisible()
    }


    //MARK: Add
    func root(scene: Scene) {
        currentViewController = viewController(for: scene)
        window.rootViewController = UINavigationController(rootViewController: currentViewController)
    }

    func push(scene: Scene) {

    }

    func modal(scene: Scene) {

    }

    //MARK: Remove
    func pop() {

    }


    private func viewController(for scene: Scene) -> UIViewController {
        switch scene {
            case .home(let r): return HomeViewController(coord: self, repo: r)
        }
    }

    private static func actualViewController(for viewController: UIViewController) -> UIViewController {
        if let navigationController = viewController as? UINavigationController {
            return navigationController.viewControllers.first!
        } else {
            return viewController
        }
    }
}
