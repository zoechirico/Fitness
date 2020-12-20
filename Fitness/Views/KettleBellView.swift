//
//  KettleBellView.swift
//  Fitness
//
//  Created by Mike Chirico on 12/20/20.
//

import SwiftUI

struct KettleBellView: View {
    @EnvironmentObject var settings: WorkoutDisplay
    @Binding var showModal:Bool
    var body: some View {
        Text(settings.display)
        KettleBell()
        
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

struct KettleBellView_Previews: PreviewProvider {
    static var previews: some View {
        KettleBellView(showModal: .constant(true))
    }
}
