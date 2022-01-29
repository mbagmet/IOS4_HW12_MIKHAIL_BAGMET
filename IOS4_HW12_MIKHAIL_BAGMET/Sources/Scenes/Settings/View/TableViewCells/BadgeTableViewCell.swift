//
//  BadgeTableViewCell.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 18.12.2021.
//

import UIKit

class BadgeTableViewCell: UITableViewCell {

    static let identifier = "BadgeTableViewCell"

    private lazy var badgeLabel: UILabel = {
        let badge = UILabel()
        badge.backgroundColor = .systemRed
        badge.textColor = .white
        badge.textAlignment = .center
        badge.layer.masksToBounds = true
        badge.layer.cornerRadius = Metric.badgeHeight / 2

        return badge
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)

        setupHierarchy()
        setupLayout()
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Settings

    private func setupHierarchy() {
        contentView.addSubview(badgeLabel)
    }

    private func setupLayout() {
        textLabel?.addConstraints(centerY: contentView.centerYAnchor, left: self.leadingAnchor, paddingLeft: Metric.titleLeftPadding)
        textLabel?.trailingAnchor.constraint(lessThanOrEqualTo: badgeLabel.leadingAnchor, constant: -Metric.marginBetweenTitleAndBadge).isActive = true

        badgeLabel.addConstraints(centerY: contentView.centerYAnchor, right: contentView.trailingAnchor,
                                  paddingRight: Metric.marginBetweenTitleAndBadge, height: Metric.badgeHeight)
    }

    private func setupView() {
        imageView?.layer.masksToBounds = true
        imageView?.layer.cornerRadius = DefaultTableViewCell.Metric.iconCornerRadius

        accessoryType = .disclosureIndicator
    }

    // MARK: - Private functions

    private func setupBadgeWidth() {
        let badgeWidth = max(Metric.badgeHeight, Metric.badgeMultimplier * Metric.badgeHeight * Metric.digitsQty)

        badgeLabel.widthAnchor.constraint(equalToConstant: badgeWidth).isActive = true
    }

    // MARK: - Configuration

    public func configureCell(with model: Settings) {
        textLabel?.text = model.name
        imageView?.image = model.icon
        detailTextLabel?.text = model.description

        badgeLabel.text = model.badge
        Metric.digitsQty = CGFloat(model.badge?.count ?? 1)
        setupBadgeWidth()
    }
}

// MARK: - Constants
extension BadgeTableViewCell {
    enum Metric {
        static let badgeHeight: CGFloat = 26
        static let badgeWidth: CGFloat = 26
        static let titleLeftPadding: CGFloat = 65
        static let marginBetweenTitleAndBadge: CGFloat = 6
        static let badgeMultimplier: CGFloat = 0.6

        static var digitsQty: CGFloat = 1
    }
}
