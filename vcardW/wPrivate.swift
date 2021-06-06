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
    
    var body: some View {
        VStack {
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
                    Text(loc_nocard)
                }
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
                        Text(entry.name).font(.footnote).bold().foregroundColor(Color("prime")).allowsTightening(true)
                        Divider()
                        Text(entry.mobilePrivate).font(.caption2).foregroundColor(Color("prime")).allowsTightening(true)
                        Text(entry.emailPrivate).font(.caption2).foregroundColor(Color("prime")).allowsTightening(true)
                        Text(entry.wwwPrivate).font(.caption2).foregroundColor(Color("prime")).allowsTightening(true)
                        Spacer()
                        Divider()
                        Text(loc_private).font(.caption2).foregroundColor(.white).allowsTightening(true)
                    }.padding(.trailing, 10).padding(.top, 10).padding(.bottom, 10)
                }.background(Color("primeInverted"))
                
            }.background(Color("primeInverted"))
        
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
                    Text(loc_private).font(.caption2).foregroundColor(.white)
                    Spacer()
                }.padding(.bottom, 10).background(Color("primeInverted"))
            }.background(Color("primeInverted"))
        }
        }.onAppear(perform: onAppear).background(Color("primeInverted"))
    }
    
    func onAppear() {
        if entry.pSet {
            let imageData = entry.imgP
            let inputImage = UIImage(data: imageData)
            image = Image(uiImage: inputImage!)
        }
    }
   
}
