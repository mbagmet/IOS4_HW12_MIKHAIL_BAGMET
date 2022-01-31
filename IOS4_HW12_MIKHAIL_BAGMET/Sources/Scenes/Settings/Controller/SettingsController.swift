//
//  SettingsController.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 09.12.2021.
//

import UIKit

class SettingsController: UIViewController {

    // MARK: = Properties

    var model: SettingsModel?

    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }

    private lazy var searchController: UISearchController = {
        var search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = Strings.searchBarPlaceholder

        return search
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        model = SettingsModel()
        view = SettingsView()

        setupNavigation()
        setupSeach()

        configureView()
        configureViewDelegate()
    }
}

// MARK: - Navigation

extension SettingsController {
    private func setupNavigation() {
        navigationItem.title = Strings.navigationTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Search

extension SettingsController {
    private func setupSeach() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
}

extension SettingsController: UISearchResultsUpdating {
    func updateSearchResults(for search: UISearchController) {
        // TODO
    }
}

// MARK: - SettingsViewDelegate

extension SettingsController: SettingsViewDelegate {
    func changeViewController(cellName: String) {
        
        print("\(Strings.cellDidSelect) \(cellName)")
        navigationController?.pushViewController(SettingsChildController(), animated: true)
    }
}

// MARK: - Configuration

extension SettingsController: SettingsModelDelegate {
    func configureView() {
        guard let model = model?.getSettingsList() else { return }
        settingsView?.configureView(with: model)
    }
}

private extension SettingsController {
    func configureViewDelegate() {
        settingsView?.delegate = self
    }
}

// MARK: - Constants

extension SettingsController {
    enum Strings {
        static let searchBarPlaceholder = "Поиск"
        static let navigationTitle = "Настройки"
        static let cellDidSelect = "Нажата ячейка"
    }
}
