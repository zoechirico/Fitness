//
//  ContentView.swift
//  Fitness
//
//  Created by Mike Chirico on 12/18/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var txt0: String = "Push Ups: \(GetCount(table: "t0"))\nSitup: \(GetCount(table: "situps"))\nKettle Bells \(GetCount(table: "KettleBell"))"
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack{
                        
                        ScrollView {
                            Text(txt0)
                                .padding(.all,30)
                                .padding([.top,.bottom],20)
                                .background(Color.red)
                                .foregroundColor(Color.black)
                                .cornerRadius(5)
                                .shadow(radius: 25)
                                .lineLimit(nil)
                                .font(Font.custom("Avenir-Black", size: 17))
                        }
                        Spacer(minLength: 4)
                        PushUp(txt0: $txt0)
                        SitUp(txt0: $txt0)
                        KettleBell(txt0: $txt0)
                        Spacer(minLength: 50)
                    }
                }
            }
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PushUp: View {
    @Binding var txt0: String
    
    var body: some View {
        Button(action: {
            AddEntry(txt: "Push-up")
            txt0 = "Push Ups: \(GetCount(table: "t0"))\nSitup: \(GetCount(table: "situps"))\nKettle Bells \(GetCount(table: "KettleBell"))"
            
        }) {
            Text("Push Ups")
                .padding(.all,30)
                .padding([.top,.bottom],20)
                .background(Color.orange)
                .foregroundColor(Color.black)
                .cornerRadius(55)
                .shadow(radius: 155)
                .font(Font.custom("Avenir-Black", size: 57))
            
        }
    }
}

struct SitUp: View {
    @Binding var txt0: String
    
    var body: some View {
        Button(action: {
            AddSitup()
            txt0 = "Push Ups: \(GetCount(table: "t0"))\nSitup: \(GetCount(table: "situps"))\nKettle Bells \(GetCount(table: "KettleBell"))"
            
        }) {
            Text("Situp")
                .padding(.all,30)
                .padding([.top,.bottom],20)
                .background(Color.blue)
                .foregroundColor(Color.black)
                .cornerRadius(55)
                .shadow(radius: 155)
                .font(Font.custom("Avenir-Black", size: 57))
            
        }
    }
}

struct KettleBell: View {
    @Binding var txt0: String
    
    var body: some View {
        Button(action: {
            AddKettleBell()
            txt0 = "Push Ups: \(GetCount(table: "t0"))\nSitup: \(GetCount(table: "situps"))\nKettle Bells \(GetCount(table: "KettleBell"))"
            
        }) {
            Text("Kettle Bell")
                .padding(.all,30)
                .padding([.top,.bottom],20)
                .background(Color.green)
                .foregroundColor(Color.black)
                .cornerRadius(55)
                .shadow(radius: 155)
                .font(Font.custom("Avenir-Black", size: 57))
            
        }
    }
}

