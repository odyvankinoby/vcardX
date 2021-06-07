//
//  wBusiness.swift
//  vcardWExtension
//
//  Created by Nicolas Ott on 06.06.21.
//

import WidgetKit
import SwiftUI
import Intents

struct wBusiness : View {
    
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    @State var image: Image? = nil
    
    var body: some View {
        VStack {
            if entry.purchased == false {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Text(loc_buy).font(.footnote).foregroundColor(.white).padding(5)
                        Spacer()
                    }
                    Spacer()
                }
            } else {
                if widgetFamily == .systemSmall {
                    VStack(alignment: .center) {
                        if image != nil {
                            image?
                                .resizable()
                                .interpolation(.none)
                                .scaledToFit()
                                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(.leading, 5)
                                .padding(.trailing, 5)
                                .padding(.top, 10)
                        } else {
                            HStack {
                                Spacer()
                                VStack {
                                    Spacer()
                                    Text(loc_nocard).font(.footnote).foregroundColor(.white).padding(5)
                                    Spacer()
                                }
                                Spacer()
                            }
                        }
                        HStack {
                            Spacer()
                            Text(loc_business).font(.caption2).foregroundColor(.white)
                            Spacer()
                        }.padding(.bottom, 5).background(Color("prime"))
                    }.background(Color("prime"))
                }
                else if widgetFamily == .systemMedium {
                    VStack(alignment: .center) {
                        HStack {
                            if image != nil {
                                image?
                                    .resizable()
                                    .interpolation(.none)
                                    .scaledToFit()
                                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(.all, 10)
                            } else {
                                Text(loc_nocard)
                            }
                            VStack(alignment: .leading) {
                                Text(entry.name).font(.footnote).bold().foregroundColor(Color("primeInverted")).allowsTightening(true)
                                Text(entry.position).font(.caption2).foregroundColor(Color("primeInverted")).allowsTightening(true)
                                Text(entry.company).font(.caption2).foregroundColor(Color("primeInverted")).allowsTightening(true)
                                Divider()
                                Text(entry.mobileBusiness).font(.caption2).foregroundColor(Color("primeInverted")).allowsTightening(true)
                                Text(entry.emailBusiness).font(.caption2).foregroundColor(Color("primeInverted")).allowsTightening(true)
                                Text(entry.wwwBusiness).font(.caption2).foregroundColor(Color("primeInverted")).allowsTightening(true)
                                Divider()
                                Text(loc_business).font(.caption2).foregroundColor(.white).allowsTightening(true)
                            }.padding(.trailing, 10).padding(.top, 10).padding(.bottom, 10)
                        }.background(Color("prime"))
                        
                    }.background(Color("prime"))
                
                } else {
                    VStack(alignment: .center) {
                        if image != nil {
                            image?
                                .resizable()
                                .interpolation(.none)
                                .scaledToFit()
                                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .padding(.top, 15)
                        } else {
                            Text(loc_nocard)
                        }
                        HStack {
                            Spacer()
                            Text(loc_business).font(.caption2).foregroundColor(.white)
                            Spacer()
                        }.padding(.bottom, 10).background(Color("prime"))
                    }.background(Color("prime"))
                }
            }
        }.onAppear(perform: onAppear).background(Color("prime"))
    }
    
    func onAppear() {
        if entry.bSet {
            let imageData = entry.imgB
            let inputImage = UIImage(data: imageData)
            image = Image(uiImage: inputImage!)
        }
    }
   
}

