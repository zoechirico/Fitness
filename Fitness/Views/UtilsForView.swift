//
//  UtilsForView.swift
//  Fitness
//
//  Created by Mike Chirico on 12/21/20.
//


import SwiftUI

struct PushUp: View {
    @EnvironmentObject var settings: WorkoutDisplay
    @State private var num: Int = 1
    
    var body: some View {
        HStack {
            VStack{
                Button(action: {
                    AddPushUp(num: Double(num))
                    settings.display = "Push Ups: \(GetCount(table: "PushUp"))\nSit Ups:  \(GetCount(table: "SitUp"))\nKettleBell:  \(GetCount(table: "KettleBell"))"
                    //txt0 = "Push Ups: \(GetCount(table: "PushUp"))"
                    
                    
                }) {
                    Text("Push Ups")
                        .padding(.all,30)
                        .padding([.top,.bottom],20)
                        .background(Color.orange)
                        .foregroundColor(Color.black)
                        .cornerRadius(55)
                        .shadow(radius: 155)
                        .font(Font.custom("Avenir-Black", size: 27))
                    
                }
                
                Button(action: {
                    AddPushUp(num: 10)
                    settings.display = "Push Ups: \(GetCount(table: "PushUp"))\nSit Ups:  \(GetCount(table: "SitUp"))\nKettleBell:  \(GetCount(table: "KettleBell"))"
                    //txt0 = "Push Ups: \(GetCount(table: "PushUp"))"
                    
                    
                }) {
                    Text("Push Ups > 9")
                        .padding(.all,30)
                        .padding([.top,.bottom],20)
                        .background(Color.green)
                        .foregroundColor(Color.black)
                        .cornerRadius(55)
                        .shadow(radius: 155)
                        .font(Font.custom("Avenir-Black", size: 27))
                    
                }
                
                Button(action: {
                    AddPushUp(num: 20)
                    settings.display = "Push Ups: \(GetCount(table: "PushUp"))\nSit Ups:  \(GetCount(table: "SitUp"))\nKettleBell:  \(GetCount(table: "KettleBell"))"
                    //txt0 = "Push Ups: \(GetCount(table: "PushUp"))"
                    
                    
                }) {
                    Text("Push Ups > 19")
                        .padding(.all,30)
                        .padding([.top,.bottom],20)
                        .background(Color.blue)
                        .foregroundColor(Color.black)
                        .cornerRadius(55)
                        .shadow(radius: 155)
                        .font(Font.custom("Avenir-Black", size: 27))
                    
                }
                
            }
        }
        
    }
}

struct SitUp: View {
    @EnvironmentObject var settings: WorkoutDisplay
    var body: some View {
        HStack {
            
            VStack {
                
                Button(action: {
                    AddSitUp()
                    settings.display="Push Ups: \(GetCount(table: "PushUp"))\nSit Ups:  \(GetCount(table: "SitUp"))\nKettleBell:  \(GetCount(table: "KettleBell"))"
                    
                }) {
                    Text("SitUp")
                        .padding(.all,30)
                        .padding([.top,.bottom],20)
                        .background(Color.blue)
                        .foregroundColor(Color.yellow)
                        .cornerRadius(55)
                        .shadow(radius: 155)
                        .font(Font.custom("Avenir-Black", size: 27))
                    
                }
                
                
                Button(action: {
                    AddSitUp(num: 10)
                    settings.display="Push Ups: \(GetCount(table: "PushUp"))\nSit Ups:  \(GetCount(table: "SitUp"))\nKettleBell:  \(GetCount(table: "KettleBell"))"
                    
                }) {
                    Text("SitUp > 9 min")
                        .padding(.all,30)
                        .padding([.top,.bottom],20)
                        .background(Color.yellow)
                        .foregroundColor(Color.black)
                        .cornerRadius(55)
                        .shadow(radius: 155)
                        .font(Font.custom("Avenir-Black", size: 27))
                    
                }
                
            }
        }
        
    }
}


struct KettleBell: View {
    @EnvironmentObject var settings: WorkoutDisplay
    
    var body: some View {
        HStack{
            Button(action: {
                AddKettleBell()
                settings.display="Push Ups: \(GetCount(table: "PushUp"))\nSit Ups:  \(GetCount(table: "SitUp"))\nKettleBell:  \(GetCount(table: "KettleBell"))"
                
                
            }) {
                Text("Kettle Bell")
                    .padding(.all,30)
                    .padding([.top,.bottom],20)
                    .background(Color.green)
                    .foregroundColor(Color.black)
                    .cornerRadius(55)
                    .shadow(radius: 155)
                    .font(Font.custom("Avenir-Black", size: 27))
                
            }
            
        }
    }
}


