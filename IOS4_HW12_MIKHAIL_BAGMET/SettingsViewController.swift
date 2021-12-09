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

//    private lazy var nameLabel: UILabel = {
//        let label = UILabel()
//        return label
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
        setupView()

        setUpNavigation()

        setupDataSource()
        // Do any additional setup after loading the view.
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
        settingsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "settingsCell")
    }

    // MARK: - Private functions

    private func setUpNavigation() {
        navigationItem.title = "Настройки"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Расширение, чтобы рассказать таблице, откуда брать данные
// Работает в паре с setupDataSource()
extension SettingsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        //print("Количество групп: \(settings.count)")
        return settings.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("Количество строк в группе: \(settings[section].count)")
        return settings[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)

        print("\(#function) --- section = \(indexPath.section), row = \(indexPath.row)")
        cell.textLabel?.text = settings[indexPath.section][indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.text = settings[indexPath.section][indexPath.row].description
        let onOfSwitch = UISwitch()
        if indexPath.section == 1 && indexPath.row == 0 {
            cell.accessoryView = onOfSwitch
        }

        return cell
    }


}
