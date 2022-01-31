//
//  SettingsChildView.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 29.01.2022.
//

import UIKit

class SettingsChildView: UIView {

    // MARK: - Properties

    private lazy var settingsTableView = UITableView(frame: self.bounds, style: UITableView.Style.insetGrouped)
    
    // MARK: - Initial

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupView()
    }

    // MARK: - Settings

    private func setupView() {
        self.backgroundColor = .secondarySystemBackground | .systemBackground
    }
}
