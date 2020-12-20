//
//  ContentView.swift
//  Fitness
//
//  Created by Mike Chirico on 12/18/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settings: WorkoutDisplay
    @State var showingDetailView = false
    @State var showingPushUpView = false
    @State var showingSitUpView = false
    @State var showingKettleBellView = false
    
    var body: some View {
        
        // CPUWheel().frame(height: 150)
        
        
        Button(action: {
            self.showingDetailView=true
        }) {
            Text(settings.display)
                .padding(.all,30)
                .padding([.top,.bottom],20)
                .background(Color.red)
                .foregroundColor(Color.black)
                .cornerRadius(55)
                .shadow(radius: 155)
                .font(Font.custom("Avenir-Black", size: 27))
        }.fullScreenCover(isPresented: $showingDetailView) {
            DetailView(showModal: $showingDetailView)
        }
        
        
        
        
        Button(action: {
            self.showingPushUpView=true
        }) {
            Text("PushUp")
                .padding(.all,30)
                .padding([.top,.bottom],20)
                .background(Color.orange)
                .foregroundColor(Color.black)
                .cornerRadius(55)
                .shadow(radius: 155)
                .font(Font.custom("Avenir-Black", size: 27))
        }.fullScreenCover(isPresented: $showingPushUpView) {
            PushUpView(showModal: $showingPushUpView)
        }
        
        Button(action: {
            self.showingSitUpView=true
        }) {
            Text("SitUp")
                .padding(.all,30)
                .padding([.top,.bottom],20)
                .background(Color.orange)
                .foregroundColor(Color.black)
                .cornerRadius(55)
                .shadow(radius: 155)
                .font(Font.custom("Avenir-Black", size: 27))
        }.fullScreenCover(isPresented: $showingSitUpView) {
            SitUpView(showModal: $showingSitUpView)
        }
        
        Button(action: {
            self.showingKettleBellView=true
        }) {
            Text("KettleBell")
                .padding(.all,30)
                .padding([.top,.bottom],20)
                .background(Color.orange)
                .foregroundColor(Color.black)
                .cornerRadius(55)
                .shadow(radius: 155)
                .font(Font.custom("Avenir-Black", size: 27))
        }.fullScreenCover(isPresented: $showingKettleBellView) {
            KettleBellView(showModal: $showingKettleBellView)
        }
        
        
        //ZViewThing()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

struct PushUp: View {
    @EnvironmentObject var settings: WorkoutDisplay
    @State private var num: Int = 1
    
    var body: some View {
        HStack {
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
            
            
        }
        
    }
}

struct SitUp: View {
    @EnvironmentObject var settings: WorkoutDisplay
    var body: some View {
        HStack {
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


struct Display: View {
    @Binding var txt0: String
    
    var body: some View {
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
    }
}

struct ZViewThing: View {
    //@State var txt0: String = "PushUp: \(GetCount(table: "PushUp"))"
    @State var showingMultipleViews = false
    @State var showingPushUpView = false
    @State var showingSitUpView = false
    @State var sitUpTxt0:String = ""
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack{
                        
                        Button(action: {
                            self.showingMultipleViews=true
                        }) {
                            //Display(txt0: $txt0)
                        }.fullScreenCover(isPresented: $showingMultipleViews) {
                            DetailView(showModal: $showingMultipleViews)
                        }
                        
                        
                        
                        Spacer(minLength: 4)
                        
                        
                        
                        Button(action: {
                            self.showingPushUpView=true
                        }) {
                            Text("PushUp View")
                                .padding(.all,30)
                                .padding([.top,.bottom],20)
                                .background(Color.orange)
                                .foregroundColor(Color.black)
                                .cornerRadius(55)
                                .shadow(radius: 155)
                                .font(Font.custom("Avenir-Black", size: 27))
                        }.fullScreenCover(isPresented: $showingPushUpView) {
                            PushUpView(showModal: $showingPushUpView)
                        }
                        
                        
                        
                        Button(action: {
                            self.showingSitUpView=true
                        }) {
                            Text("SitUp View")
                                .padding(.all,30)
                                .padding([.top,.bottom],20)
                                .background(Color.orange)
                                .foregroundColor(Color.black)
                                .cornerRadius(55)
                                .shadow(radius: 155)
                                .font(Font.custom("Avenir-Black", size: 27))
                        }.fullScreenCover(isPresented: $showingSitUpView) {
                            SitUpView(showModal: $showingSitUpView)
                        }
                        
                        
                        //                        PushUp(txt0: $txt0)
                        //                        SitUp(txt0: $txt0)
                        //                        KettleBell(txt0: $txt0)
                        Spacer(minLength: 50)
                    }
                }
            }
        }
    }
}
