//
//  QrView.swift
//  CheckRx
//
//  Created by Kevin Zheng on 2022-07-17.
//

import SwiftUI

struct QrView: View {
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
                Button(action: {print("hi")}) {
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
            }.offset(y: -120)
        }
    }
}

struct QrView_Previews: PreviewProvider {
    static var previews: some View {
        QrView()
    }
}
