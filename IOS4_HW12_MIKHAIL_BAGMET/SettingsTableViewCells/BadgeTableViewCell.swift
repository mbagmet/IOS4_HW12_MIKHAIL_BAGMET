//
//  BadgeTableViewCell.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 18.12.2021.
//

import UIKit

class BadgeTableViewCell: UITableViewCell {

    static let identifier = "BadgeTableViewCell"

    lazy var badgeLabel: UILabel = {
        let badge = UILabel()
        badge.backgroundColor = .systemRed
        badge.textColor = .white
        badge.textAlignment = .center
        badge.layer.masksToBounds = true
        badge.layer.cornerRadius = Metric.badgeHeight / 2

        let digitsQty: CGFloat = 1
        let width = max(Metric.badgeHeight, 0.6 * Metric.badgeHeight * digitsQty)
        badge.widthAnchor.constraint(equalToConstant: width).isActive = true

        return badge
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)

        setupHierarchy()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Settings

    private func setupHierarchy() {
        self.contentView.addSubview(badgeLabel)
    }

    private func setupLayout() {
        self.textLabel?.addConstraints(centerY: contentView.centerYAnchor, left: self.leadingAnchor, paddingLeft: 65)
        self.textLabel?.trailingAnchor.constraint(lessThanOrEqualTo: badgeLabel.leadingAnchor, constant: -6).isActive = true

        badgeLabel.addConstraints(centerY: contentView.centerYAnchor, right: contentView.trailingAnchor, paddingRight: 6, height: Metric.badgeHeight)

        self.imageView?.layer.masksToBounds = true
        self.imageView?.layer.cornerRadius = 7
    }
}

extension BadgeTableViewCell {
    enum Metric {
        static let badgeHeight: CGFloat = 26
        static let badgeWidth: CGFloat = 26
    }
}
