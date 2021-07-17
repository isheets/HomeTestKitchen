//
//  LaunchView.swift
//  Home Test Kitchen
//
//  Created by Isaac Sheets on 7/17/21.
//

import UIKit

class LaunchView: UIView {

    init() {
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) { nil }

    private func setup() {
        backgroundColor = .white
        layout()
    }

    private func layout() {
        label.activate(
            anchors: [.centerX(0), .centerY(0)],
            relativeTo: self
        )
    }

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Launching...."
        addSubview(label)
        return label
    }()
}

