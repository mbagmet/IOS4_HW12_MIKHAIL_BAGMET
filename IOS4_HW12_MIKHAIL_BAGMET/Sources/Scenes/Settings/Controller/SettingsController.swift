//
//  SettingsController.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 09.12.2021.
//

import UIKit

class SettingsController: UIViewController {

    lazy var model = SettingsModel.getSettingsList()

    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }

    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view = SettingsView()
    }

    // MARK: - Private func

    private func setupNavigation() {
        navigationItem.title = Strings.navigationTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Обработка нажатия на ячейку

extension SettingsController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = model[indexPath.section][indexPath.row]

        CurrentCell.name = model.name ?? Strings.cellNotFound

        tableView.deselectRow(at: indexPath, animated: true)
        print("\(Strings.cellDidSelect) \(CurrentCell.name)")

        navigationController?.pushViewController(SettingsChildViewController(), animated: true)
    }
}

// MARK: - Current Cell

extension SettingsController {
    enum CurrentCell {
        static var name: String = ""
    }
}

// MARK: - Search

extension SettingsController: UISearchResultsUpdating {
    func updateSearchResults(for search: UISearchController) {
        // TODO
    }
}

// MARK: - Constants

extension SettingsController {
    enum Strings {
//        static let searchBarPlaceholder = "Поиск"
        static let navigationTitle = "Настройки"
        static let cellNotFound = "<не определена>"
        static let cellDidSelect = "Нажата ячейка"
    }
}
