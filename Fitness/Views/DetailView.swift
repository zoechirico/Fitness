//
//  DetailView.swift
//  Fitness
//
//  Created by Mike Chirico on 12/19/20.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var settings: WorkoutDisplay
    @Binding var showModal:Bool
    @State var showingDetailView = false
    @State var showingClearDetailView = false
    var body: some View {
        Text("Detailed View... stats go here")
        
        Button(action: {
            print("clear data")
            showingClearDetailView = true
        }) {
            Text("Clear Data")
                .padding([.all],50)
                .background(Color.red)
                .foregroundColor(Color.yellow)
                .cornerRadius(15)
                .shadow(radius: 15)
                .shadow(radius: 155)
                .font(Font.custom("Avenir-Black", size: 27))
        }.fullScreenCover(isPresented: $showingClearDetailView) {
            ClearDataView(showModal: $showingClearDetailView)
        }
        
        
        
        Button(action: {
            self.showModal=false
        }) {
            Text("Dismiss")
                .padding([.all],10)
                .background(Color.green)
                .foregroundColor(Color.yellow)
                .cornerRadius(15)
                .shadow(radius: 15)
                .shadow(radius: 155)
                .font(Font.custom("Avenir-Black", size: 27))
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(showModal: .constant(true))
    }
}
