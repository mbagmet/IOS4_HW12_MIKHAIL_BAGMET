//
//  SwitchTableViewCell.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 10.12.2021.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    static let identifier = "SwitchTableViewCell"

    private lazy var onOfSwitch = UISwitch()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Settings

    private func setupView() {
        imageView?.layer.masksToBounds = true
        imageView?.layer.cornerRadius = DefaultTableViewCell.Metric.iconCornerRadius

        accessoryView = onOfSwitch
    }

    // MARK: - Configuration

    public func configureCell(with model: Settings) {
        textLabel?.text = model.name
        imageView?.image = model.icon
        detailTextLabel?.text = model.description

        switch model.type {
        case let .withSwitch(isOn):
            onOfSwitch.isOn = isOn
        default:
            onOfSwitch.isOn = false
        }
    }
}
