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
    
    // Business
    @Published var bLastName: String { didSet { UserDefaults.standard.set(bLastName, forKey: "bLastName") } }
    @Published var bFirstName: String { didSet { UserDefaults.standard.set(bFirstName, forKey: "bFirstName") } }
    @Published var bMobile: String { didSet { UserDefaults.standard.set(bMobile, forKey: "bMobile") } }
    @Published var bLandline: String { didSet { UserDefaults.standard.set(bLandline, forKey: "bLandline") } }
    @Published var bMail: String { didSet { UserDefaults.standard.set(bMail, forKey: "bMail") } }
    @Published var bWww: String { didSet { UserDefaults.standard.set(bWww, forKey: "bWww") } }
 
    // Private
    @Published var pLastName: String { didSet { UserDefaults.standard.set(pLastName, forKey: "pLastName") } }
    @Published var pFirstName: String { didSet { UserDefaults.standard.set(pFirstName, forKey: "pFirstName") } }
    @Published var pMobile: String { didSet { UserDefaults.standard.set(pMobile, forKey: "pMobile") } }
    @Published var pLandline: String { didSet { UserDefaults.standard.set(pLandline, forKey: "pLandline") } }
    @Published var pMail: String { didSet { UserDefaults.standard.set(pMail, forKey: "pMail") } }
    @Published var pWww: String { didSet { UserDefaults.standard.set(pWww, forKey: "pWww") } }
   
    init() {
        
        self.bLastName = UserDefaults.standard.object(forKey: "bLastName") as? String ?? ""
        self.bFirstName = UserDefaults.standard.object(forKey: "bFirstName") as? String ?? ""
        self.bMobile = UserDefaults.standard.object(forKey: "bMobile") as? String ?? "+"
        self.bLandline = UserDefaults.standard.object(forKey: "bLandline") as? String ?? "+"
        self.bMail = UserDefaults.standard.object(forKey: "bMail") as? String ?? ""
        self.bWww = UserDefaults.standard.object(forKey: "bWww") as? String ?? "https://"
        
        self.pLastName = UserDefaults.standard.object(forKey: "pLastName") as? String ?? ""
        self.pFirstName = UserDefaults.standard.object(forKey: "pFirstName") as? String ?? ""
        self.pMobile = UserDefaults.standard.object(forKey: "pMobile") as? String ?? "+"
        self.pLandline = UserDefaults.standard.object(forKey: "pLandline") as? String ?? "+"
        self.pMail = UserDefaults.standard.object(forKey: "pMail") as? String ?? ""
        self.pWww = UserDefaults.standard.object(forKey: "pWww") as? String ?? "https://"

    }
}
