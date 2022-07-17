//
//  App.swift
//  CheckRx
//
//  Created by Kevin Zheng on 2022-07-16.
//

import SwiftUI

struct Application: View {
    @State var logged_in: Bool = false
    
    var body: some View {
        if !logged_in {
            FirstScreen(logged_in: $logged_in)
        } else {
            Primary()
        }
    }
}

struct App_Previews: PreviewProvider {
    static var previews: some View {
        Application()
    }
}
