//
//  SitupView.swift
//  Fitness
//
//  Created by Mike Chirico on 12/20/20.
//

import SwiftUI

struct SitUpView: View {
    @EnvironmentObject var settings: WorkoutDisplay
    @Binding var showModal:Bool
    
    var body: some View {
        Text(settings.display)
        SitUp()
        
        
        Button(action: {
            self.showModal=false
        }) {
            Text("Dismiss")
                .padding([.all],10)
                .background(Color.green)
                .foregroundColor(Color.yellow)
                .cornerRadius(15)
                .shadow(radius: 15)
                .font(Font.custom("Avenir-Black", size: 27))
        }
    }
}



struct SitupView_Previews: PreviewProvider {
    static var previews: some View {
        SitUpView(showModal: .constant(true))
    }
}
