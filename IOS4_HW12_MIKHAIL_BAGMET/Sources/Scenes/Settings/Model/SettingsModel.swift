//
//  SettingsModel.swift
//  IOS4_HW12_MIKHAIL_BAGMET
//
//  Created by Михаил on 09.12.2021.
//

import Foundation

final class SettingsModel {
    func getSettingsList() -> [[Settings]] {
        let settings = [
            [
                Settings(name: "Михаил Багмет", icon: "person.crop.circle.fill", badge: nil, description: "Apple ID, iCloud, контент и покупки", type: .profile)
            ],
            [
                Settings(name: "Авиарежим", icon: "airplane_mode", badge: nil, description: nil, type: .withSwitch(isOn: false)),
                Settings(name: "Wi-Fi", icon: "wifi", badge: nil, description: "Не подключено", type: .byDefault),
                Settings(name: "Bluetooth", icon: "bluetooth", badge: nil, description: "Вкл.", type: .byDefault),
                Settings(name: "Сотовая связь", icon: "cellular", badge: nil, description: nil, type: .byDefault),
                Settings(name: "Режим модема", icon: "modem_mode", badge: nil, description: "Выкл.", type: .byDefault),
                Settings(name: "VPN", icon: "vpn", badge: nil, description: "Не подключено", type: .byDefault)
            ],
            [
                Settings(name: "Уведомления", icon: "notifications", badge: nil, description: nil, type: .byDefault),
                Settings(name: "Звуки, тактильные сигналы", icon: "speaker", badge: "32", description: nil, type: .withBadge),
                Settings(name: "Фокусирование", icon: "moon", badge: nil, description: nil, type: .byDefault),
                Settings(name: "Экранное время", icon: "hourglass", badge: nil, description: nil, type: .byDefault),
            ],
            [
                Settings(name: "Основные", icon: "settings", badge: "1", description: nil, type: .withBadge),
                Settings(name: "Пункт управления", icon: "switches", badge: nil, description: nil, type: .byDefault),
                Settings(name: "Экран и яркость", icon: "screen", badge: nil, description: nil, type: .byDefault),
                Settings(name: "Экран Домой", icon: "home_screen", badge: nil, description: nil, type: .byDefault),
                Settings(name: "Универсальный доступ", icon: "man", badge: nil, description: nil, type: .byDefault),
                Settings(name: "Обои", icon: "wallpapers", badge: nil, description: nil, type: .byDefault),
                Settings(name: "Siri и Поиск", icon: "siri", badge: nil, description: nil, type: .byDefault),
                Settings(name: "Touch ID и код-пароль", icon: "touch_id", badge: nil, description: nil, type: .byDefault),
                Settings(name: "Экстренный вызов — SOS", icon: "sos", badge: nil, description: nil, type: .byDefault),
                Settings(name: "Уведомление о контакте", icon: "virus", badge: nil, description: nil, type: .byDefault),
                Settings(name: "Аккумулятор", icon: "battery", badge: nil, description: nil, type: .byDefault),
                Settings(name: "Конфиденциальность", icon: "hand", badge: nil, description: nil, type: .byDefault)
            ],
            [
                Settings(name: "App Store", icon: "appstore", badge: "12", description: nil, type: .withBadge),
                Settings(name: "Wallet и Apple Pay", icon: "wallet", badge: nil, description: nil, type: .byDefault)
            ]
        ]

        return settings
    }
}
