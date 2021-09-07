//
//  PrivateData.swift
//  vcardX
//
//  Created by Nicolas Ott on 12.06.21.
//

import SwiftUI

struct PrivateData: View {
    
    @ObservedObject var settings: UserSettings
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Group {
                    if settings.mobilePrivate != "" {
                    Text(loc_mobile).font(.caption2).foregroundColor(.prime)
                    Text(settings.mobilePrivate).font(.subheadline).foregroundColor(.prime).bold()
                    }
                    if settings.landlinePrivate != "" {
                    Text(loc_landline).font(.caption2).foregroundColor(.prime)
                    Text(settings.landlinePrivate).font(.subheadline).foregroundColor(.prime).bold()
                    }
                }
                Divider()
                Group {
                    if settings.emailPrivate != "" {
                    Text(loc_email_business).font(.caption2).foregroundColor(.prime)
                    Text(settings.emailPrivate).font(.subheadline).foregroundColor(.prime).bold()
                    }
                    if settings.emailPrivateOther != "" {
                    Text(loc_email_other).font(.caption2).foregroundColor(.prime)
                    Text(settings.emailPrivateOther).font(.subheadline).foregroundColor(.prime).bold()
                    }
                    if settings.wwwPrivate != "" {
                    Text(loc_www).font(.caption2).foregroundColor(.prime)
                    Text(settings.wwwPrivate).font(.subheadline).foregroundColor(.prime).bold()
                    }
                }
                Divider()
                Group {
                    if settings.street1Private != "" {
                    Text(loc_street).font(.caption2).foregroundColor(.prime)
                    Text(settings.street1Private).font(.subheadline).foregroundColor(.prime).bold()
                    }
                    if settings.zipPrivate != "" {
                    Text(loc_zip).font(.caption2).foregroundColor(.prime)
                    Text(settings.zipPrivate).font(.subheadline).foregroundColor(.prime).bold()
                    }
                    if settings.cityPrivate != "" {
                    Text(loc_city).font(.caption2).foregroundColor(.prime)
                    Text(settings.cityPrivate).font(.subheadline).foregroundColor(.prime).bold()
                    }
                    if settings.countryPrivate != "" {
                    Text(loc_country).font(.caption2).foregroundColor(.prime)
                    Text(settings.countryPrivate).font(.subheadline).foregroundColor(.prime).bold()
                    }
                }
            }.padding()
            Spacer()
        }
    }
}

