//
//  FitnessApp.swift
//  Fitness
//
//  Created by Mike Chirico on 12/18/20.
//

import SwiftUI


@main
struct FitnessApp: App {
    var settings = WorkoutDisplay()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(settings)
        }
    }
}
