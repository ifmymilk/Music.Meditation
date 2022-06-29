//
//  Music_MeditationApp.swift
//  Music Meditation
//
//  Created by Simon LE on 12/06/2022.
//

import SwiftUI

@main
struct Music_MeditationApp: App {
    @StateObject var audioManager = AudioManager()
    var body: some Scene {
        WindowGroup {
            MeditationView(meditationVM: MeditationViewModel(meditation: Meditation.data.randomElement()!))
                .environmentObject(AudioManager())
        }
    }
}
