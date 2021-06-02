//
//  UserSettings.swift
//  traX
//
//  Created by Nicolas Ott on 08.06.20.
//  Copyright © 2020 Nicolas Ott. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class UserSettings: ObservableObject {
    
    //var keyStore = NSUbiquitousKeyValueStore()
    //@Published var cloudValue: String { didSet { keyStore.set(cloudValue, forKey: "cloudValue") } }
    
    // User Account Data
    @Published var pLastName: String { didSet { UserDefaults.standard.set(pLastName, forKey: "pLastName") } }
    @Published var pFirstName: String { didSet { UserDefaults.standard.set(pFirstName, forKey: "pFirstName") } }
    @Published var pMobile: String { didSet { UserDefaults.standard.set(pMobile, forKey: "pMobile") } }
    @Published var pLandline: String { didSet { UserDefaults.standard.set(pLandline, forKey: "pLandline") } }
    @Published var pMail: String { didSet { UserDefaults.standard.set(pMail, forKey: "pMail") } }
   
    init() {
        
        self.pLastName = UserDefaults.standard.object(forKey: "pLastName") as? String ?? "Last Name"
        self.pFirstName = UserDefaults.standard.object(forKey: "pFirstName") as? String ?? "First Name"
        self.pMobile = UserDefaults.standard.object(forKey: "pMobile") as? String ?? "Mobile"
        self.pLandline = UserDefaults.standard.object(forKey: "pLandline") as? String ?? "Landline"
        self.pMail = UserDefaults.standard.object(forKey: "pMail") as? String ?? "Email"
    }
}
