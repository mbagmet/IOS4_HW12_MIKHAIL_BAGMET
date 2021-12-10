//
//  SettingsData.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 09.12.2021.
//

import UIKit

struct Settings {
    let name: String?
    let icon: UIImage?
    let badge: Int?
    let description: String?
}

class SettingsData {
    static func getSettingsList() -> [[Settings]] {
        let settings = [
            [
                Settings(name: "Михаил Багмет", icon: nil, badge: nil, description: "Apple ID, iCloud, контент и покупки")
            ],
            [
                Settings(name: "Авиарежим", icon: UIImage(named: "airplane_mode"), badge: nil, description: nil),
                Settings(name: "Wi-Fi", icon: UIImage(named: "wi-fi"), badge: nil, description: "Не подключено"),
                Settings(name: "Bluetooth", icon: UIImage(named: "bluetooth"), badge: nil, description: "Вкл."),
                Settings(name: "Сотовая связь", icon: nil, badge: 1, description: nil),
                Settings(name: "Режим модема", icon: nil, badge: nil, description: "Выкл."),
                Settings(name: "VPN", icon: nil, badge: nil, description: "Не подключено")
            ],
            [
                Settings(name: "Уведомления", icon: nil, badge: nil, description: nil),
                Settings(name: "Звуки, тактильные сигналы", icon: nil, badge: nil, description: nil),
                Settings(name: "Фокусирование", icon: nil, badge: nil, description: nil),
                Settings(name: "Экранное время", icon: nil, badge: nil, description: nil),
            ],
            [
                Settings(name: "Основные", icon: UIImage(named: "settings-1"), badge: 1, description: nil),
                Settings(name: "Пункт управления", icon: nil, badge: nil, description: nil),
                Settings(name: "Экран и яркость", icon: nil, badge: nil, description: nil),
                Settings(name: "Экран Домой", icon: nil, badge: nil, description: nil),
                Settings(name: "Универсальный доступ", icon: nil, badge: nil, description: nil),
                Settings(name: "Обои", icon: nil, badge: nil, description: nil),
                Settings(name: "Siri и Поиск", icon: nil, badge: nil, description: nil),
                Settings(name: "Touch ID и код-пароль", icon: nil, badge: nil, description: nil),
                Settings(name: "Экстренный вызов — SOS", icon: nil, badge: nil, description: nil),
                Settings(name: "Уведомление о контакте", icon: nil, badge: nil, description: nil),
                Settings(name: "Аккумулятор", icon: nil, badge: nil, description: nil),
                Settings(name: "Конфиденциальность", icon: nil, badge: nil, description: nil)
            ],
            [
                Settings(name: "App Store", icon: nil, badge: nil, description: nil),
                Settings(name: "Wallet и Apple Pay", icon: nil, badge: nil, description: nil)
            ]

        ]

        return settings
    }
}
