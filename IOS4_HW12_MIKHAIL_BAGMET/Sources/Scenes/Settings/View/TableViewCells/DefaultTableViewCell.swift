//
//  DefaultTableViewCell.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 10.12.2021.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {

    static let identifier = "DefaultTableViewCell"

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
        imageView?.layer.cornerRadius = Metric.iconCornerRadius

        accessoryType = .disclosureIndicator
    }

    // MARK: - Configuration

    public func configureCell(with model: Settings) {
        textLabel?.text = model.name
        imageView?.image = model.icon
        detailTextLabel?.text = model.description
    }
}

// MARK: - Constants
extension DefaultTableViewCell {
    enum Metric {
        static let iconCornerRadius: CGFloat = 7
    }
}
