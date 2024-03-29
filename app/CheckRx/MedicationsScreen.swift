//
//  MedicationsScreen.swift
//  CheckRx
//
//  Created by Kevin Zheng on 2022-07-17.
//

import SwiftUI

struct MedicationsScreen: View {
    @State var is_qr: Bool = false;
    var body: some View {
        if(!is_qr) {
            MedView(is_qr: $is_qr)
        } else {
            QrtView(is_qr: $is_qr)
        }
    
    }
}

struct QrtView: View {
    @Binding var is_qr: Bool;
    var body: some View {
        ZStack {
            let backgroundColor = Color("crx_green")
            backgroundColor.ignoresSafeArea()
            
            Rectangle().offset(y:700).zIndex(45)
            
            VStack {
                Image("logo_white")
                    .resizable()
                    .frame(width: 110.0, height: 110.0)
                Text("Sharing John Smith's Records")
                    .font(.headline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center).foregroundColor(.white)
                Image("jsmith_qrc")
                    .resizable()
                    .frame(width: 210.0, height: 210.0)
                Text("Scan QR code to access in browser")
                    .font(.headline)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center).foregroundColor(.white)
                Text("Exit this screen to stop sharing")
                    .font(.headline)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center).foregroundColor(.white)
                Button(action: {is_qr = false}) {
                    HStack {
                        Text("Exit")
                            .fontWeight(.bold)
                            .font(.body)
                    }
                    .frame(maxWidth: 98, maxHeight: 4)
                    .padding()
                    .foregroundColor(Color("crx_green"))
                    .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 8)))
                }.offset(y:20)
            }.offset(y: -80)
        }
    }
}

struct MedView: View {
    @Binding var is_qr: Bool;
    var body: some View {
        ZStack {
            let backgroundColor = Color("crx_green")
            backgroundColor.ignoresSafeArea()
            
            Rectangle().offset(y:733).zIndex(45)
            
            HStack{
                Button(action: {is_qr = true}) {
                    HStack {
                        Text("Share QR code")
                            .fontWeight(.bold)
                            .font(.caption).underline()
                    }
                    .frame(maxWidth: 98, maxHeight: 4)
                    .padding()
                    .foregroundColor(Color("crx_green"))
                    .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 8)))
                }
                
            }.zIndex(46).offset(x:117, y:-293)
            
            // content starts here
            HStack{
                Image("medications")
                    .resizable()
                    .frame(width: 390.0, height: 780.0)
                    .offset(x: -2, y: -50)
            }
            
        }
    }
}

struct MedicationsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MedicationsScreen()
    }
}
