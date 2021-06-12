//
//  BusinessData.swift
//  vcardX
//
//  Created by Nicolas Ott on 12.06.21.
//
import SwiftUI

struct BusinessData: View {
    
    @ObservedObject var settings: UserSettings
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    Text(loc_mobile).font(.caption2).foregroundColor(.prime)
                    Text(settings.mobileBusiness).font(.subheadline).foregroundColor(.prime).bold()
                    Text(loc_landline).font(.caption2).foregroundColor(.prime)
                    Text(settings.landlineBusiness).font(.subheadline).foregroundColor(.prime).bold()
                }
                Divider()
                Group {
                    Text(loc_email_business).font(.caption2).foregroundColor(.prime)
                    Text(settings.emailBusiness).font(.subheadline).foregroundColor(.prime).bold()
                    Text(loc_email_other).font(.caption2).foregroundColor(.prime)
                    Text(settings.emailBusinessOther).font(.subheadline).foregroundColor(.prime).bold()
                    Text(loc_www).font(.caption2).foregroundColor(.prime)
                    Text(settings.wwwBusiness).font(.subheadline).foregroundColor(.prime).bold()
                }
                Divider()
                Group {
                    Text(loc_street).font(.caption2).foregroundColor(.prime)
                    Text(settings.street1Business).font(.subheadline).foregroundColor(.prime).bold()
                    Text(loc_street2).font(.caption2).foregroundColor(.prime)
                    Text(settings.street2Business).font(.subheadline).foregroundColor(.prime).bold()
                    Text(loc_zip).font(.caption2).foregroundColor(.prime)
                    Text(settings.zipBusiness).font(.subheadline).foregroundColor(.prime).bold()
                    Text(loc_city).font(.caption2).foregroundColor(.prime)
                    Text(settings.cityBusiness).font(.subheadline).foregroundColor(.prime).bold()
                    Text(loc_country).font(.caption2).foregroundColor(.prime)
                    Text(settings.countryBusiness).font(.subheadline).foregroundColor(.prime).bold()
                }
            }.padding()
            Spacer()
        }
    }
}
