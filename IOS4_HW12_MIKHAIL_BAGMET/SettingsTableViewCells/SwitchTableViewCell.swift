//
//  SwitchTableViewCell.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 10.12.2021.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    static let identifier = "SwitchTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)

        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Settings

    private func setupLayout() {
        self.imageView?.layer.masksToBounds = true
        self.imageView?.layer.cornerRadius = 7
    }

}
