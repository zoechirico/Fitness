//
//  PushUpView.swift
//  Fitness
//
//  Created by Mike Chirico on 12/20/20.
//

import SwiftUI

struct PushUpView: View {
    @EnvironmentObject var settings: WorkoutDisplay
    @State var txt0:String = "Push Ups: \(GetCount(table: "PushUp"))"
    @Binding var showModal:Bool
    var body: some View {
        Text(settings.display)
        PushUp()
        
        Button(action: {
            self.showModal=false
        }) {
            Text("Dismiss")
                .padding([.all],10)
                .background(Color.green)
                .foregroundColor(Color.yellow)
                .cornerRadius(15)
                .shadow(radius: 15)
        }
    }
}



struct PushUpView_Previews: PreviewProvider {
    static var previews: some View {
        PushUpView(showModal: .constant(true))
    }
}
