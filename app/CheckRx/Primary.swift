//
//  Primary.swift
//  CheckRx
//
//  Created by Kevin Zheng on 2022-07-17.
//

import SwiftUI

struct Primary: View {
    init() {
    }
    var body: some View {
        TabView {
            HomeScreen(BloodGlucose: "6.4")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            MedicationsScreen()
                .tabItem {
                    Image(systemName: "pills")
                    Text("Medications")
                }
            DocumentsScreen()
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("Documents")
                }
            SettingsScreen()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }.accentColor(.white)
            .onAppear() {
                UITabBar.appearance().barTintColor = .white
            }
    }
}

struct Primary_Previews: PreviewProvider {
    static var previews: some View {
        Primary()
    }
}

struct MedicationsView: View {
    var body: some View {
        ZStack {
            let backgroundColor = Color("crx_green")
            backgroundColor.ignoresSafeArea()
            
            Rectangle().offset(y:700)
        }
    }
}
