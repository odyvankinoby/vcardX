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
    
    @Published var launchedBefore: Bool {
             didSet {
                 UserDefaults.standard.set(launchedBefore, forKey: "launchedBefore")
             }
    }
    @Published var vcards: String { didSet { UserDefaults.standard.set(vcards, forKey: "vcards")
           }
    }
    public var vcardsArray = ["All","Business","Private"]
   
    // Name
    @Published var lastName: String { didSet { UserDefaults.standard.set(lastName, forKey: "lastName") } }
    @Published var firstName: String { didSet { UserDefaults.standard.set(firstName, forKey: "firstName") } }
    @Published var middleName: String { didSet { UserDefaults.standard.set(middleName, forKey: "middleName") } }
    @Published var nickName: String { didSet { UserDefaults.standard.set(nickName, forKey: "nickName") } }
    @Published var dob: Date { didSet { UserDefaults.standard.set(dob, forKey: "dob") } }
    
    @Published var company: String { didSet { UserDefaults.standard.set(company, forKey: "company") } }
    @Published var position: String { didSet { UserDefaults.standard.set(position, forKey: "position") } }
    @Published var mobileBusiness: String { didSet { UserDefaults.standard.set(mobileBusiness, forKey: "mobileBusiness") } }
    @Published var landlineBusiness: String { didSet { UserDefaults.standard.set(landlineBusiness, forKey: "landlineBusiness") } }
    @Published var emailBusiness: String { didSet { UserDefaults.standard.set(emailBusiness, forKey: "emailBusiness") } }
    @Published var emailBusinessOther: String { didSet { UserDefaults.standard.set(emailBusinessOther, forKey: "emailBusinessOther") } }
    @Published var wwwBusiness: String { didSet { UserDefaults.standard.set(wwwBusiness, forKey: "wwwBusiness") } }
    
    @Published var street1Business: String { didSet { UserDefaults.standard.set(street1Business, forKey: "street1Business") } }
    @Published var street2Business: String { didSet { UserDefaults.standard.set(street2Business, forKey: "street2Business") } }
    @Published var zipBusiness: String { didSet { UserDefaults.standard.set(zipBusiness, forKey: "zipBusiness") } }
    @Published var cityBusiness: String { didSet { UserDefaults.standard.set(cityBusiness, forKey: "cityBusiness") } }
    @Published var countryBusiness: String { didSet { UserDefaults.standard.set(countryBusiness, forKey: "countryBusiness") } }
    
    @Published var mobilePrivate: String { didSet { UserDefaults.standard.set(mobilePrivate, forKey: "mobilePrivate") } }
    @Published var landlinePrivate: String { didSet { UserDefaults.standard.set(landlinePrivate, forKey: "landlinePrivate") } }
    @Published var emailPrivate: String { didSet { UserDefaults.standard.set(emailPrivate, forKey: "emailPrivate") } }
    @Published var emailPrivateOther: String { didSet { UserDefaults.standard.set(emailPrivateOther, forKey: "emailPrivateOther") } }
    @Published var wwwPrivate: String { didSet { UserDefaults.standard.set(wwwPrivate, forKey: "wwwPrivate") } }
    
    @Published var street1Private: String { didSet { UserDefaults.standard.set(street1Private, forKey: "street1Private") } }
    @Published var street2Private: String { didSet { UserDefaults.standard.set(street2Private, forKey: "street2Private") } }
    @Published var zipPrivate: String { didSet { UserDefaults.standard.set(zipPrivate, forKey: "zipPrivate") } }
    @Published var cityPrivate: String { didSet { UserDefaults.standard.set(cityPrivate, forKey: "cityPrivate") } }
    @Published var countryPrivate: String { didSet { UserDefaults.standard.set(countryPrivate, forKey: "countryPrivate") } }
  
    @Published var qrImageBusiness: Any { didSet { UserDefaults.standard.set(qrImageBusiness, forKey: "qrImageBusiness") } }
    @Published var qrBusinessSet: Bool { didSet { UserDefaults.standard.set(qrBusinessSet, forKey: "qrBusinessSet") } }
    
    @Published var qrImagePrivate: Any { didSet { UserDefaults.standard.set(qrImagePrivate, forKey: "qrImagePrivate") } }
    @Published var qrPrivateSet: Bool { didSet { UserDefaults.standard.set(qrPrivateSet, forKey: "qrPrivateSet") } }
    
    @Published var imgBusiness: Any { didSet { UserDefaults.standard.set(imgBusiness, forKey: "imgBusiness") } }
    @Published var imgBusinessSet: Bool { didSet { UserDefaults.standard.set(imgBusinessSet, forKey: "imgBusinessSet") } }
    
    @Published var imgPrivate: Any { didSet { UserDefaults.standard.set(imgPrivate, forKey: "imgPrivate") } }
    @Published var imgPrivateSet: Bool { didSet { UserDefaults.standard.set(imgPrivateSet, forKey: "imgPrivateSet") } }
    
    @Published var purchased: Bool { didSet { UserDefaults.standard.set(purchased, forKey: "de.nicolasott.vcardX.premium") } }
    
    @Published var appVersion: String { didSet { UserDefaults.standard.set(appVersion, forKey: "appVersion") } }
    @Published var appBuild: String { didSet { UserDefaults.standard.set(appBuild, forKey: "appBuild") } }
    @Published var appVersionString: String { didSet { UserDefaults.standard.set(appVersionString, forKey: "appVersionString") } }

    init() {
        self.purchased = UserDefaults.standard.object(forKey: "de.nicolasott.vcardX.premium") as? Bool ?? false
        self.launchedBefore = UserDefaults.standard.object(forKey: "launchedBefore") as? Bool ?? false
        
        self.appVersion = UserDefaults.standard.object(forKey: "appVersion") as? String ?? ""
        self.appBuild = UserDefaults.standard.object(forKey: "appBuild") as? String ?? ""
        self.appVersionString = UserDefaults.standard.object(forKey: "appVersionString") as? String ?? ""
       
        self.vcards = UserDefaults.standard.object(forKey: "vcards") as? String ?? "All"

        self.lastName = UserDefaults.standard.object(forKey: "lastName") as? String ?? ""
        self.firstName = UserDefaults.standard.object(forKey: "firstName") as? String ?? ""
        self.middleName = UserDefaults.standard.object(forKey: "middleName") as? String ?? ""
        self.nickName = UserDefaults.standard.object(forKey: "nickName") as? String ?? ""
        self.dob = UserDefaults.standard.object(forKey: "dob") as? Date ?? Date()
        
        self.company = UserDefaults.standard.object(forKey: "company") as? String ?? ""
        self.position = UserDefaults.standard.object(forKey: "position") as? String ?? ""
        self.mobileBusiness = UserDefaults.standard.object(forKey: "mobileBusiness") as? String ?? ""
        self.landlineBusiness = UserDefaults.standard.object(forKey: "landlineBusiness") as? String ?? ""
        self.emailBusiness = UserDefaults.standard.object(forKey: "emailBusiness") as? String ?? ""
        self.emailBusinessOther = UserDefaults.standard.object(forKey: "emailBusinessOther") as? String ?? ""
        
        self.wwwBusiness = UserDefaults.standard.object(forKey: "wwwBusiness") as? String ?? ""

        self.street1Business = UserDefaults.standard.object(forKey: "street1Business") as? String ?? ""
        self.street2Business = UserDefaults.standard.object(forKey: "street2Business") as? String ?? ""
        self.zipBusiness = UserDefaults.standard.object(forKey: "zipBusiness") as? String ?? ""
        self.cityBusiness = UserDefaults.standard.object(forKey: "cityBusiness") as? String ?? ""
        self.countryBusiness = UserDefaults.standard.object(forKey: "countryBusiness") as? String ?? ""
        
        self.mobilePrivate = UserDefaults.standard.object(forKey: "mobilePrivate") as? String ?? ""
        self.landlinePrivate = UserDefaults.standard.object(forKey: "landlinePrivate") as? String ?? ""
        self.emailPrivate = UserDefaults.standard.object(forKey: "emailPrivate") as? String ?? ""
        self.emailPrivateOther = UserDefaults.standard.object(forKey: "emailPrivateOther") as? String ?? ""
        self.wwwPrivate = UserDefaults.standard.object(forKey: "wwwPrivate") as? String ?? ""

        self.street1Private = UserDefaults.standard.object(forKey: "street1Private") as? String ?? ""
        self.street2Private = UserDefaults.standard.object(forKey: "street2Private") as? String ?? ""
        self.zipPrivate = UserDefaults.standard.object(forKey: "zipPrivate") as? String ?? ""
        self.cityPrivate = UserDefaults.standard.object(forKey: "cityPrivate") as? String ?? ""
        self.countryPrivate = UserDefaults.standard.object(forKey: "countryPrivate") as? String ?? ""
    
        self.qrImageBusiness = UserDefaults.standard.object(forKey: "qrImageBusiness") as Any
        self.qrBusinessSet = UserDefaults.standard.object(forKey: "qrBusinessSet") as? Bool ?? false
        
        self.qrImagePrivate = UserDefaults.standard.object(forKey: "qrImagePrivate") as Any
        self.qrPrivateSet = UserDefaults.standard.object(forKey: "qrPrivateSet") as? Bool ?? false
    
        self.imgBusiness = UserDefaults.standard.object(forKey: "imgBusiness") as Any
        self.imgBusinessSet = UserDefaults.standard.object(forKey: "imgBusinessSet") as? Bool ?? false
        
        self.imgPrivate = UserDefaults.standard.object(forKey: "imgPrivate") as Any
        self.imgPrivateSet = UserDefaults.standard.object(forKey: "imgPrivateSet") as? Bool ?? false
    }
}
