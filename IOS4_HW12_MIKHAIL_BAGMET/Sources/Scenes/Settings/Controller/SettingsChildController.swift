//
//  SettingsChildController.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 17.12.2021.
//

import UIKit

class SettingsChildController: UIViewController {

    // MARK: - Properties

    private var settingsView: SettingsChildView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsChildView
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view = SettingsChildView()

        setupNavigation()
    }

    // MARK: - Settings

    private func setupNavigation() {
        navigationItem.largeTitleDisplayMode = .never
        title = SettingsView.CurrentCell.name
    }

    // MARK: - Initializers

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
