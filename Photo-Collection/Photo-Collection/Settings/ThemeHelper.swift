//
//  ThemeHelper.swift
//  Photo-Collection
//
//  Created by Jeff Kang on 6/27/20.
//  Copyright © 2020 Jeff Kang. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = "ThemePreference"
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
    }
}
