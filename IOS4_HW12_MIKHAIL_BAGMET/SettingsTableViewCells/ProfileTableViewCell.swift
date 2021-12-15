//
//  ProfileTableViewCell.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 10.12.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    static let identifier = "ProfileTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Settings

    private func setupLayout() {
        self.textLabel?.font = .systemFont(ofSize: 20)
        self.textLabel?.addConstraints(top: self.topAnchor, paddingTop: 14, left: self.leadingAnchor, paddingLeft: 90, right: self.trailingAnchor, paddingRight: 42)
        self.detailTextLabel?.addConstraints(top: self.textLabel?.bottomAnchor, paddingTop: 2, left: self.leadingAnchor, paddingLeft: 90, right: self.trailingAnchor, paddingRight: 42)

        self.imageView?.tintColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7960784314, alpha: 1)
        self.imageView?.addConstraints(left: self.leadingAnchor, paddingLeft: 12)
    }
}
