//
//  Settings.swift
//  AFL4
//
//  Created by SIFT - Telkom DBT Air 4 on 30/05/22.
//

import SwiftUI

struct Settings: View {
    @State private var toggledark = true
    var body: some View {
        NavigationView{
            HStack{
                VStack{
                    HStack{
                        Text("Appearance")
                        Spacer()
                    }.padding([.top,.leading], 26.0)
                        .padding(.bottom, -10.0)
                    HStack{
                        HStack{
                            Image(systemName: "moon.stars")
                            Text("Dark Mode")
                        }.padding()
                        Spacer()
                        Toggle("", isOn: $toggledark)
                            .padding()
                    }
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                    .padding([.top, .leading, .trailing])
                    .padding(.bottom, -5.0)
                    HStack{
                        Text("Help")
                        Spacer()
                    }.padding([.top,.leading], 26.0)
                        .padding(.bottom, -10.0)
                    HStack{
                        HStack{
                            Image(systemName: "doc")
                            Text("Version")
                        }.padding()
                        Spacer()
                        Text("0.0.1").bold()
                            .padding()
                            
                    }
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                    .padding([.top, .leading, .trailing])
                    .padding(.bottom, -5.0)
                    HStack{
                        HStack{
                            Image(systemName: "info.circle")
                            Text("About")
                        }.padding()
                        Spacer()
                    }
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                    .padding([.top, .leading, .trailing])
                    .padding(.bottom, -5.0)
                    Spacer()
                    VStack{
                        Text("This Application is my project for Advanced Mobile Application Developer subject.")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                }.cornerRadius(10)
            }.navigationTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
