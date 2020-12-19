//
//  ContentView.swift
//  Fitness
//
//  Created by Mike Chirico on 12/18/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var txt0: String = "Push Ups: \(GetCount())"
    @State var txt1: String = "Count: \(GetCount())"
    
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack{
                        Spacer(minLength: 140)
                        Text(txt0)
                            .padding(.all,30)
                            .padding([.top,.bottom],20)
                            .background(Color.red)
                            .foregroundColor(Color.black)
                            .cornerRadius(5)
                            .shadow(radius: 25)
                            .font(Font.custom("Avenir-Black", size: 27))
                        Spacer(minLength: 4)
                        Button(action: {
                            AddEntry(txt: "Push-up")
                            txt0 = "Push Ups: \(GetCount())"

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
                        
                        Button(action: {
                            AddSitup()
                            txt1 = "Situp: \(GetCount())"

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
