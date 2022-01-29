//
//  SettingsViewController.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 09.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    private lazy var model = SettingsModel.getSettingsList()

    private lazy var settingsTableView = UITableView(frame: view.bounds, style: UITableView.Style.insetGrouped)

    private lazy var searchController: UISearchController = {
        var searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Strings.searchBarPlaceholder

        return searchController
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
        setupView()

        setupNavigation()

        setupSeachController()

        setupDataSource()
        setupDelegate()
        setupTableCells()
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(settingsTableView)
    }

    private func setupLayout() {
        settingsTableView.addConstraints(top: view.topAnchor, left: view.leadingAnchor, paddingLeft: Metric.sidePadding,
                                         right: view.trailingAnchor, paddingRight: Metric.sidePadding, bottom: view.bottomAnchor)
    }

    private func setupView() {
        view.backgroundColor = .secondarySystemBackground | .systemBackground
    }

    private func setupDataSource() {
        settingsTableView.dataSource = self
    }

    private func setupDelegate() {
        settingsTableView.delegate = self
    }

    private func setupTableCells() {
        settingsTableView.register(DefaultTableViewCell.self, forCellReuseIdentifier: DefaultTableViewCell.identifier)
        settingsTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        settingsTableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        settingsTableView.register(BadgeTableViewCell.self, forCellReuseIdentifier: BadgeTableViewCell.identifier)
    }

    private func setupSeachController() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }

    // MARK: - Private functions

    private func setupNavigation() {
        navigationItem.title = Strings.navigationTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Data source, модель ячейки
// Работает в паре с setupDataSource()

extension SettingsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let model = model[indexPath.section][indexPath.row]

        switch model.type {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell else {
                return UITableViewCell()
            }

            cell.configureCell(with: model)
            return cell

        case .withSwitch:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }

            cell.configureCell(with: model)
            return cell

        case .withBadge:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BadgeTableViewCell.identifier, for: indexPath) as? BadgeTableViewCell else {
                return UITableViewCell()
            }

            cell.configureCell(with: model)
            return cell

        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.identifier, for: indexPath) as? DefaultTableViewCell else {
                return UITableViewCell()
            }

            cell.configureCell(with: model)
            return cell
        }
    }
}

// MARK: - Delegate, обработка высоты рядов
// Работает в паре с setupDelegate()

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = model[indexPath.section][indexPath.row]
        
        if model.type == .profile {
            return Metric.profileCellHeight
        } else if model.type == .withBadge {
            return Metric.badgeCellHeight
        }

        return UITableView.automaticDimension
    }
}

// MARK: - Обработка нажатия на ячейку

extension SettingsViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = model[indexPath.section][indexPath.row]

        CurrentCell.name = model.name ?? Strings.cellNotFound

        tableView.deselectRow(at: indexPath, animated: true)
        print("\(Strings.cellDidSelect) \(CurrentCell.name)")

        navigationController?.pushViewController(SettingsChildViewController(), animated: true)
    }
}

// MARK: - Current Cell

extension SettingsViewController {
    enum CurrentCell {
        static var name: String = ""
    }
}

// MARK: - Search

extension SettingsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}

// MARK: - Constants

extension SettingsViewController {
    enum Metric {
        static let profileCellHeight: CGFloat = 72
        static let badgeCellHeight: CGFloat = 44
        static let sidePadding: CGFloat = 0
    }

    enum Strings {
        static let searchBarPlaceholder = "Поиск"
        static let navigationTitle = "Настройки"
        static let cellNotFound = "<не определена>"
        static let cellDidSelect = "Нажата ячейка"
    }
}
