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
        guard let model = model?.getSettingsList() else { return }

        let cell = model[indexPath.section][indexPath.row]

        CurrentCell.name = cell.name ?? Strings.cellNotFound

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

// MARK: - Configuration

private extension SettingsController {
    /// Реализация метода для конфигурирования нашего View исходя из того, что нам создаст OnboardingModel
    func configureView() {
        guard let model = model?.getSettingsList() else { return }
        settingsView?.configureView(with: model)
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
