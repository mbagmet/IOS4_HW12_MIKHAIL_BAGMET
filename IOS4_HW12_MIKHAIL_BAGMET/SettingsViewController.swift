//
//  SettingsViewController.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 09.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    private lazy var settingsTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
        setupView()

        setUpNavigation()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(settingsTableView)
    }

    private func setupLayout() {
        settingsTableView.addConstraints(top: view.topAnchor, left: view.leadingAnchor, paddingLeft: 20, right: view.trailingAnchor, paddingRight: 20, bottom: view.bottomAnchor)
    }

    private func setupView() {
        view.backgroundColor = .secondarySystemBackground | .systemBackground
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
