//
//  MedicationsScreen.swift
//  CheckRx
//
//  Created by Kevin Zheng on 2022-07-17.
//

import SwiftUI

struct MedicationsScreen: View {
    var body: some View {
        ZStack {
            let backgroundColor = Color("crx_green")
            backgroundColor.ignoresSafeArea()
            
            Rectangle().offset(y:700)
        }
    }
}

struct MedicationsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MedicationsScreen()
    }
}
