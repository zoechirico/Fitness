//
//  DetailView.swift
//  Fitness
//
//  Created by Mike Chirico on 12/19/20.
//

import SwiftUI

struct DetailView: View {
    @Binding var showModal:Bool
    var body: some View {
        Text("Detailed View... stats go here")
        
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

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(showModal: .constant(true))
    }
}
