//
//  ClearDataView.swift
//  Fitness
//
//  Created by Mike Chirico on 12/20/20.
//

import SwiftUI

struct ClearDataView: View {
    @EnvironmentObject var settings: WorkoutDisplay
    @Binding var showModal:Bool
    var body: some View {
        Text(settings.display)
        
        Spacer()
        
        Button(action: {
            print("delete")
            settings.display="DATA DELETED!!"
            DeleteAll()
        }) {
            Text("Are you sure?\nWILL DELETE!")
                .padding([.all],10)
                .background(Color.yellow)
                .foregroundColor(Color.black)
                .cornerRadius(15)
                .shadow(radius: 15)
                .font(Font.custom("Avenir-Black", size: 27))
        }
        
        Spacer()
        
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

struct ClearDataView_Previews: PreviewProvider {
    static var previews: some View {
        ClearDataView(showModal: .constant(true))
    }
}
