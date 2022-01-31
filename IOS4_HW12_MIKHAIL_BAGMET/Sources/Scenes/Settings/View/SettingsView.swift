//
//  SettingsView.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 29.01.2022.
//

import UIKit

class SettingsView: UIView, SettingsViewUserIterations {

    // MARK: - Configuration

    func configureView(with model: [[Settings]]) {
        self.model = model
        settingsTableView.reloadData()
    }

    // MARK: - Properies

    var delegate: SettingsViewDelegate?

    // MARK: - Private properties

    private var model = [[Settings]]()

    // MARK: - Views

    private lazy var settingsTableView = UITableView(frame: self.bounds, style: UITableView.Style.insetGrouped)

    private lazy var search: UISearchController = {
        var search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = Strings.searchBarPlaceholder

        return search
    }()

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
        setupHierarchy()
        setupLayout()
        setupView()

//        setupSeach()

        setupDataSource()
        setupDelegate()
        setupTableCells()
    }

    // MARK: - Settings

    private func setupHierarchy() {
        self.addSubview(settingsTableView)
    }

    private func setupLayout() {
        settingsTableView.addConstraints(top: self.topAnchor, left: self.leadingAnchor, paddingLeft: Metric.sidePadding,
                                         right: self.trailingAnchor, paddingRight: Metric.sidePadding, bottom: self.bottomAnchor)
    }

    private func setupView() {
        self.backgroundColor = .secondarySystemBackground | .systemBackground
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

//    private func setupSeach() {
//        search.searchResultsUpdater = SettingsController.self
//        navigationItem.searchController = search
//    }
}

// MARK: - Delegate, обработка высоты рядов
// Работает в паре с setupDelegate()

extension SettingsView: UITableViewDelegate {

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

// MARK: - Data source, модель ячейки
// Работает в паре с setupDataSource()

extension SettingsView: UITableViewDataSource {

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

// MARK: - Обработка нажатия на ячейку

extension SettingsView {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = model[indexPath.section][indexPath.row]

        CurrentCell.name = cell.name ?? Strings.cellNotFound
        tableView.deselectRow(at: indexPath, animated: true)

        delegate?.changeViewController(cellName: CurrentCell.name)
    }
}

// MARK: - Current Cell

extension SettingsView {
    enum CurrentCell {
        static var name: String = ""
    }
}

// MARK: - Constants

extension SettingsView {
    enum Metric {
        static let profileCellHeight: CGFloat = 72
        static let badgeCellHeight: CGFloat = 44
        static let sidePadding: CGFloat = 0
    }

    enum Strings {
        static let searchBarPlaceholder = "Поиск"
        static let cellNotFound = "<не определена>"
    }
}
