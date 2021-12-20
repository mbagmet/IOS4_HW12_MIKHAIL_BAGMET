//
//  SettingsViewController.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 09.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    private lazy var settings = SettingsData.getSettingsList()

    private lazy var settingsTableView = UITableView(frame: view.bounds, style: UITableView.Style.insetGrouped)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
        setupView()

        setupNavigation()

        setupDataSource()
        setupDelegate()
        setupTableCells()
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(settingsTableView)
    }

    private func setupLayout() {
        settingsTableView.addConstraints(top: view.topAnchor, left: view.leadingAnchor, paddingLeft: 0, right: view.trailingAnchor, paddingRight: 0, bottom: view.bottomAnchor)
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

    // MARK: - Private functions

    private func setupNavigation() {
        navigationItem.title = "Настройки"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Расширение, чтобы рассказать таблице, откуда брать данные
// Работает в паре с setupDataSource()
extension SettingsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch settings[indexPath.section][indexPath.row].type {
        case .profile:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as! ProfileTableViewCell

            cell.textLabel?.text = settings[indexPath.section][indexPath.row].name
            cell.imageView?.image = settings[indexPath.section][indexPath.row].icon
            cell.detailTextLabel?.text = settings[indexPath.section][indexPath.row].description
            cell.accessoryType = .disclosureIndicator

            return cell

        case .withSwitch:
            let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as! SwitchTableViewCell

            cell.textLabel?.text = settings[indexPath.section][indexPath.row].name
            cell.imageView?.image = settings[indexPath.section][indexPath.row].icon
            cell.detailTextLabel?.text = settings[indexPath.section][indexPath.row].description

            let onOfSwitch = UISwitch()
            cell.accessoryView = onOfSwitch

            return cell

        case .withBadge:
            let cell = tableView.dequeueReusableCell(withIdentifier: BadgeTableViewCell.identifier, for: indexPath) as! BadgeTableViewCell

            cell.textLabel?.text = settings[indexPath.section][indexPath.row].name
            cell.imageView?.image = settings[indexPath.section][indexPath.row].icon
            cell.badgeLabel.text = settings[indexPath.section][indexPath.row].badge
            cell.accessoryType = .disclosureIndicator

            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: DefaultTableViewCell.identifier, for: indexPath) as! DefaultTableViewCell

            cell.textLabel?.text = settings[indexPath.section][indexPath.row].name
            cell.imageView?.image = settings[indexPath.section][indexPath.row].icon
            cell.detailTextLabel?.text = settings[indexPath.section][indexPath.row].description
            cell.accessoryType = .disclosureIndicator

            return cell
        }
    }
}

// MARK: - Расширение для увеличения высоты рядов, а также для реагирования на нажатия
// Работает в паре с setupDelegate()

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if settings[indexPath.section][indexPath.row].type == .profile {
            return 72
        } else if settings[indexPath.section][indexPath.row].type == .withBadge {
            return 44
        }
        // Use the default size for all other rows.
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CurrentCell.name = settings[indexPath.section][indexPath.row].name ?? "<не определена>"

        tableView.deselectRow(at: indexPath, animated: true)
        print("Нажата ячейка \(CurrentCell.name)")

        navigationController?.pushViewController(SettingsChildViewController(), animated: true)
    }
}

// MARK: - Current Cell
extension SettingsViewController {
    enum CurrentCell {
        static var name: String = ""
    }
}
