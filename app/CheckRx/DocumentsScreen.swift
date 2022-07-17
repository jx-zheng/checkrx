//
//  DocumentsScreen.swift
//  CheckRx
//
//  Created by Kevin Zheng on 2022-07-17.
//

import SwiftUI

struct DocumentsScreen: View {
    var body: some View {
        ZStack {
            let backgroundColor = Color("crx_green")
            backgroundColor.ignoresSafeArea()
            
            Rectangle().offset(y:700)
        }
    }
}

struct DocumentsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DocumentsScreen()
    }
}
