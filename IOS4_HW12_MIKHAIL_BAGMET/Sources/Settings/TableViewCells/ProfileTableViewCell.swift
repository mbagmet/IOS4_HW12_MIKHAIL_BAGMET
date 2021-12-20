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
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Settings

    private func setupLayout() {
        textLabel?.addConstraints(top: self.topAnchor, paddingTop: 14, left: self.leadingAnchor, paddingLeft: 90, right: self.trailingAnchor, paddingRight: 42)
        detailTextLabel?.addConstraints(top: self.textLabel?.bottomAnchor, paddingTop: 2,
                                        left: self.leadingAnchor, paddingLeft: 90, right: self.trailingAnchor, paddingRight: 42)
    }

    private func setupView() {
        textLabel?.font = .systemFont(ofSize: 20)

        imageView?.tintColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7960784314, alpha: 1)
        imageView?.addConstraints(left: self.leadingAnchor, paddingLeft: 12)

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
extension ProfileTableViewCell {
    enum Metric {
        static let iconConfiguration = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 60, weight: .ultraLight))
    }
}
