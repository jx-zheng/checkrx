//
//  MedicationsScreen.swift
//  CheckRx
//
//  Created by Kevin Zheng on 2022-07-17.
//

import SwiftUI

struct MedicationsScreen: View {
    let gridSquareHeight: CGFloat = 130.0;
    let gridSquareWidth: CGFloat = 150.0;
    var body: some View {
        ZStack {
            let backgroundColor = Color("crx_green")
            backgroundColor.ignoresSafeArea()
            
            Rectangle().offset(y:700)
            
            // content starts here
            
            VStack {
                
                ZStack{
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 12.0)).zIndex(50).offset(x:-160, y:18)
                    HStack {
                        Text("My name is")
                            .fontWeight(.bold)
                            .font(.headline).foregroundColor(.black)
                        Text("John Smith")
                            .fontWeight(.bold)
                            .font(.headline).foregroundColor(Color("crx_green")).underline().offset(x:-3)
                    }.zIndex(2)
                        .frame(maxWidth: 320, maxHeight: 25)
                        .padding()
                        .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 15)))
                }
                
                ZStack{
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 12.0)).zIndex(50).offset(x:-160, y:18)
                    HStack {
                        Text("My family doctor is")
                            .fontWeight(.bold)
                            .font(.headline).foregroundColor(.black)
                        Text("Dr. Jamie Fang")
                            .fontWeight(.bold)
                            .font(.headline).foregroundColor(Color("crx_green")).underline().offset(x:-3)
                    }
                    .frame(maxWidth: 320, maxHeight: 25)
                    .padding()
                    .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 15)))
                }
                
                ZStack{
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 12.0)).zIndex(50).offset(x:-160, y:18)
                    
                    VStack {
                        Text("My primary pharmacy is")
                            .fontWeight(.bold)
                            .font(.headline).foregroundColor(.black)
                        Text("Apothecary (King St.)")
                            .fontWeight(.bold)
                            .font(.headline).foregroundColor(Color("crx_green")).underline()
                    }
                    .frame(maxWidth: 320, maxHeight: 25)
                    .padding()
                    .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 15)))
                    
                }
                
                VStack {
                    HStack {
                        ZStack {
                            Text("6.4").fontWeight(.bold).zIndex(45).font(.system(size: 50)).foregroundColor(Color("crx_burgundy")).offset(x:-10, y:20)
                            Text("mmol/L").fontWeight(.semibold).zIndex(45).font(.system(size: 17)).foregroundColor(Color("crx_burgundy")).offset(x:-10, y:55)
                            VStack {
                                Text("Most Recent Blood Sugar Reading")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center).foregroundColor(.white)
                                    .offset(y:8)
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white).frame(width: gridSquareWidth, height: gridSquareHeight)
                            }.offset(x:-10)
                        }
                        ZStack {
                            Text("75").fontWeight(.bold).zIndex(45).font(.system(size: 50)).foregroundColor(Color("crx_burgundy")).offset(x:10, y:20)
                            Text("bpm").fontWeight(.semibold).zIndex(45).font(.system(size: 17)).foregroundColor(Color("crx_burgundy")).offset(x:10, y:55)
                            VStack {
                                Text("Most Recent Heart Rate Reading")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.center).foregroundColor(.white).offset(y:8)
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white).frame(width: gridSquareWidth, height: gridSquareHeight)
                            }.offset(x:10)
                        }
                    }
                    HStack{
                        ZStack {
                            Text("5673").fontWeight(.bold).zIndex(45).font(.system(size: 50)).foregroundColor(Color("crx_burgundy")).offset(x:-10, y:20)
                            Text("steps").fontWeight(.semibold).zIndex(45).font(.system(size: 17)).foregroundColor(Color("crx_burgundy")).offset(x:-10, y:55)
                            VStack {
                                Text("Steps Walked Today")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.center).foregroundColor(.white).offset(y:8)
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white).frame(width: gridSquareWidth, height: gridSquareHeight)
                            }.offset(x:-10, y:10)
                        }
                        
                        ZStack {
                            Text("Yes").fontWeight(.bold).zIndex(45).font(.system(size: 50)).foregroundColor(Color("crx_burgundy")).offset(x:10, y:10)
                            Text("recorded at 10:17 AM").fontWeight(.semibold).multilineTextAlignment(.center).zIndex(45).font(.system(size: 17)).foregroundColor(Color("crx_burgundy")).offset(x:10, y:55).frame(width:100)
                            VStack {
                                Text("Have you taken your medication?")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.center).foregroundColor(.white).frame(width: 140).offset(y:8)
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white).frame(width: gridSquareWidth, height: gridSquareHeight)
                            }.offset(x:10)
                        }
                    }
                }
                
                Text("Customize gadgets").font(.callout).foregroundColor(.orange).underline()
                Image("logo_colored")
                    .resizable()
                    .frame(width: 80.0, height: 80.0)
                
            }.offset(y: -10)
        }
    }
}

struct MedicationsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MedicationsScreen()
    }
}
