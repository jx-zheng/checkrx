//
//  MedicationsScreen.swift
//  CheckRx
//
//  Created by Kevin Zheng on 2022-07-17.
//

import SwiftUI
import HealthKit

struct GetHealthState {
    let healthStore = HKHealthStore()
    
    func authorizeHK() {
        let read = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!, HKObjectType.quantityType(forIdentifier: .bloodGlucose)!, HKObjectType.quantityType(forIdentifier: .stepCount)!])
        let share = Set<HKSampleType>()
        healthStore.requestAuthorization(toShare: share, read: read) { (chk, error) in
            if(chk) {
                print("permission granted")
            }
        }
        
    }
    
    func getBg() -> String {
        guard let sampleType = HKObjectType.quantityType(forIdentifier: .bloodGlucose) else {
            return "0.0";
        }
        var latestBG: Double = 0.0;
        let semaphore2 = DispatchSemaphore(value: 0)
        
        let startDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor]) {
            (sample, result, error) in
            guard error == nil else {
                return
            }
            let mass = HKUnitMolarMassBloodGlucose
            let mmolPerLiter = HKUnit.moleUnit(with: .milli, molarMass: mass).unitDivided(by: .liter())
            let data = result![0] as! HKQuantitySample
            let unit = mmolPerLiter
            latestBG = data.quantity.doubleValue(for: unit)
            semaphore2.signal()
        }
        healthStore.execute(query)
        semaphore2.wait()
        let data = String(format: "%.1f", latestBG)
        return data
    }
}

struct HomeScreen: View {
    let gridSquareHeight: CGFloat = 130.0;
    let gridSquareWidth: CGFloat = 150.0;
    @State var HKState = GetHealthState()
    @State var BloodGlucose: String;
    
    var body: some View {
        ZStack {
            let backgroundColor = Color("crx_green")
            backgroundColor.ignoresSafeArea()
            
            Rectangle().offset(y:700)
            
            // content starts here
            
            VStack {
                
                ZStack{
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 12.0)).zIndex(50).offset(x:-160, y:18).onAppear(perform: { HKState.authorizeHK()})
                    HStack {
                        Text("My name is")
                            .fontWeight(.bold)
                            .font(.headline).foregroundColor(.black).onAppear(perform: {BloodGlucose = HKState.getBg()})
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
                            Text(BloodGlucose).fontWeight(.bold).zIndex(45).font(.system(size: 50)).foregroundColor(Color("crx_burgundy")).offset(x:-10, y:20)
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

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(BloodGlucose: "5.2")
    }
}
