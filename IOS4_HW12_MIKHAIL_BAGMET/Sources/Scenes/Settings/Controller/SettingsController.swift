//
//  SettingsController.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 09.12.2021.
//

import UIKit

class SettingsController: UIViewController {

    var model: SettingsModel?

    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }

    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        model = SettingsModel()
        view = SettingsView()

        setupNavigation()

        configureView()
        configureViewDelegate()
    }

    // MARK: - Private func

    private func setupNavigation() {
        navigationItem.title = Strings.navigationTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Search

extension SettingsController: UISearchResultsUpdating {
    func updateSearchResults(for search: UISearchController) {
        // TODO
    }
}

// MARK: - SettingsViewDelegate

extension SettingsController: SettingsViewDelegate {
    func changeViewController(cellName: String) {
        
        print("\(Strings.cellDidSelect) \(cellName)")
        navigationController?.pushViewController(SettingsChildViewController(), animated: true)
    }
}

// MARK: - Configuration

private extension SettingsController {
    func configureView() {
        guard let model = model?.getSettingsList() else { return }
        settingsView?.configureView(with: model)
    }

    func configureViewDelegate() {
        settingsView?.delegate = self
    }
}

// MARK: - Constants

extension SettingsController {
    enum Strings {
//        static let searchBarPlaceholder = "Поиск"
        static let navigationTitle = "Настройки"
        static let cellDidSelect = "Нажата ячейка"
    }
}
