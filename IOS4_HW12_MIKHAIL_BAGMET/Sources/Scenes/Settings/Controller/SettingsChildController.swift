//
//  SettingsChildViewController.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 17.12.2021.
//

import UIKit

class SettingsChildViewController: UIViewController {

    private lazy var settingsTableView = UITableView(frame: view.bounds, style: UITableView.Style.insetGrouped)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupNavigation()
    }

    // MARK: - Settings

    private func setupView() {
        view.backgroundColor = .secondarySystemBackground | .systemBackground
    }

    private func setupNavigation() {
        navigationItem.largeTitleDisplayMode = .never
        title = SettingsView.CurrentCell.name
    }

    //MARK: - Initializers

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
