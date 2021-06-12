//
//  wPrivate.swift
//  vcardWExtension
//
//  Created by Nicolas Ott on 06.06.21.
//
import WidgetKit
import SwiftUI
import Intents

struct wPrivate : View {
    
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    @State var image: Image? = nil
    @State var user: Image? = nil
    
    var body: some View {
        VStack {
            if entry.purchased == false || image == nil {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Text(entry.purchased == false ? loc_buy : loc_nocard).font(.footnote).foregroundColor(.white).padding(5)
                        Spacer()
                    }
                    Spacer()
                }
            } else {
                if widgetFamily == .systemSmall {
                    
                    VStack(alignment: .center) {
                        image?
                            .resizable()
                            .interpolation(.none)
                            .scaledToFit()
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.leading, 5)
                            .padding(.trailing, 5)
                            .padding(.top, 10)
                        HStack {
                            Spacer()
                            Text(loc_private).font(.caption2).foregroundColor(.white)
                            Spacer()
                        }.padding(.bottom, 5).background(Color("primeInverted"))
                    }.background(Color("primeInverted"))
                }
                else if widgetFamily == .systemMedium {
                        VStack(alignment: .center) {
                            HStack {
                                image?
                                    .resizable()
                                    .interpolation(.none)
                                    .scaledToFit()
                                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(.top, 10).padding(.bottom, 10).padding(.leading, 15)
                            VStack(alignment: .leading) {
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading) {
                                        Text(entry.name).font(.footnote).bold().foregroundColor(Color("prime")).allowsTightening(true)
                                    }
                                    Spacer()
                                    user?
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        .overlay(Circle()
                                                    .stroke(Color.white, lineWidth: 1)
                                                    .frame(width: 36, height: 36, alignment: .trailing))
                                        .frame(width: 36, height: 36, alignment: .trailing)
                                        .shadow(radius: 1)
                                        .padding(.top, 2)
                                    
                                }
                                Divider()
                                Text(entry.mobilePrivate).font(.caption2).foregroundColor(Color("prime")).allowsTightening(true)
                                Text(entry.emailPrivate).font(.caption2).foregroundColor(Color("prime")).allowsTightening(true)
                                Text(entry.wwwPrivate).font(.caption2).foregroundColor(Color("prime")).allowsTightening(true)
                                Spacer()
                                Divider()
                                Text(loc_private).font(.caption2).foregroundColor(.white).allowsTightening(true)
                            }.padding(.all, 10)
                        }.background(Color("primeInverted"))
                    }.background(Color("primeInverted"))
                } else {
                    VStack(alignment: .center) {
                        image?
                            .resizable()
                            .interpolation(.none)
                            .scaledToFit()
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                            .padding(.top, 15)
                        HStack {
                            Spacer()
                            Text(loc_private).font(.caption2).foregroundColor(.white)
                            Spacer()
                        }.padding(.bottom, 10).background(Color("primeInverted"))
                    }.background(Color("primeInverted"))
                }
            }
        }.onAppear(perform: onAppear).background(Color("primeInverted"))
    }
    
    func onAppear() {
        
        if entry.qrPSet {
            let imageData = entry.qrP
            let inputImage = UIImage(data: imageData)
            image = Image(uiImage: inputImage!)
        }
        
        if entry.showUserPic && entry.userImgPSet {
            let imageData = entry.userImgP
            let inputImage = UIImage(data: imageData)
            user = Image(uiImage: inputImage!)
        }
    }
}

