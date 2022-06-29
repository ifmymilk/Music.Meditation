//
//  MeditationViewModel.swift
//  Music Meditation
//
//  Created by Simon LE on 13/06/2022.
//

import Foundation



final class MeditationViewModel: ObservableObject {
    
    
    @Published var meditation: Meditation
    
    init(meditation: Meditation) {
    self.meditation = meditation
    }
}


struct Meditation {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    
    static let data = [Meditation(title: "Relaxing Minutes of Meditation", description: "Clear your mind and slumber into the nothingless. Allocate only a few moments for a quick breather.", duration: 70, track: "meditation1", image: "image1"),
                       Meditation(title: "Sense Your Surround", description: "Clear your mind and slumber into the nothingless. Allocate only a few moments for a quick breather.", duration: 70, track: "meditation2", image: "image2"),
                       Meditation(title: "Listen To The Wind", description: "Clear your mind and slumber into the nothingless. Allocate only a few moments for a quick breather.", duration: 70, track: "meditation3", image: "image3"),
                       Meditation(title: "Become One With Nature", description: "Clear your mind and slumber into the nothingless. Allocate only a few moments for a quick breather.", duration: 70, track: "meditation4", image: "image4"),
                       Meditation(title: "Calm and Emptiness", description: "Clear your mind and slumber into the nothingless. Allocate only a few moments for a quick breather.", duration: 70, track: "meditation5", image: "image5")
                       ]
}


