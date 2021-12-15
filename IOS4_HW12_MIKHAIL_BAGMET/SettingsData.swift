//
//  SettingsData.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 09.12.2021.
//

import UIKit

enum CellType {
    case profile
    case byDefault
    case withSwitch
}

struct Settings {
    let name: String?
    let icon: UIImage?
    let badge: Int?
    let description: String?
    let type: CellType?
}

let configuration = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 60, weight: .ultraLight))

class SettingsData {
    static func getSettingsList() -> [[Settings]] {
        let settings = [
            [
                Settings(name: "Михаил Багмет", icon: UIImage(systemName: "person.crop.circle.fill", withConfiguration: configuration), badge: nil,
                         description: "Apple ID, iCloud, контент и покупки", type: .profile)
            ],
            [
                Settings(name: "Авиарежим", icon: UIImage(named: "airplane_mode"), badge: nil, description: nil, type: .withSwitch),
                Settings(name: "Wi-Fi", icon: UIImage(named: "wifi"), badge: nil, description: "Не подключено", type: .byDefault),
                Settings(name: "Bluetooth", icon: UIImage(named: "bluetooth"), badge: nil, description: "Вкл.", type: .byDefault), 
                Settings(name: "Сотовая связь", icon: UIImage(named: "cellular"), badge: 1, description: nil, type: .byDefault),
                Settings(name: "Режим модема", icon: UIImage(named: "modem_mode"), badge: nil, description: "Выкл.", type: .byDefault),
                Settings(name: "VPN", icon: UIImage(named: "vpn"), badge: nil, description: "Не подключено", type: .byDefault)
            ],
            [
                Settings(name: "Уведомления", icon: UIImage(named: "notifications"), badge: nil, description: nil, type: .byDefault),
                Settings(name: "Звуки, тактильные сигналы", icon: UIImage(named: "speaker"), badge: nil, description: nil, type: .byDefault),
                Settings(name: "Фокусирование", icon: UIImage(named: "moon"), badge: nil, description: nil, type: .byDefault),
                Settings(name: "Экранное время", icon: UIImage(named: "hourglass"), badge: nil, description: nil, type: .byDefault),
            ],
            [
                Settings(name: "Основные", icon: UIImage(named: "settings"), badge: 1, description: nil, type: .byDefault),
                Settings(name: "Пункт управления", icon: UIImage(named: "switches"), badge: nil, description: nil, type: .byDefault),
                Settings(name: "Экран и яркость", icon: UIImage(named: "screen"), badge: nil, description: nil, type: .byDefault),
                Settings(name: "Экран Домой", icon: UIImage(named: "home_screen"), badge: nil, description: nil, type: .byDefault),
                Settings(name: "Универсальный доступ", icon: UIImage(named: "man"), badge: nil, description: nil, type: .byDefault),
                Settings(name: "Обои", icon: UIImage(named: "wallpapers"), badge: nil, description: nil, type: .byDefault),
                Settings(name: "Siri и Поиск", icon: UIImage(named: "siri"), badge: nil, description: nil, type: .byDefault),
                Settings(name: "Touch ID и код-пароль", icon: UIImage(named: "touch_id"), badge: nil, description: nil, type: .byDefault),
                Settings(name: "Экстренный вызов — SOS", icon: UIImage(named: "sos"), badge: nil, description: nil, type: .byDefault),
                Settings(name: "Уведомление о контакте", icon: UIImage(named: "virus"), badge: nil, description: nil, type: .byDefault),
                Settings(name: "Аккумулятор", icon: UIImage(named: "battery"), badge: nil, description: nil, type: .byDefault),
                Settings(name: "Конфиденциальность", icon: UIImage(named: "hand"), badge: nil, description: nil, type: .byDefault)
            ],
            [
                Settings(name: "App Store", icon: UIImage(named: "appstore"), badge: nil, description: nil, type: .byDefault),
                Settings(name: "Wallet и Apple Pay", icon: UIImage(named: "wallet"), badge: nil, description: nil, type: .byDefault)
            ]

        ]

        return settings
    }
}
