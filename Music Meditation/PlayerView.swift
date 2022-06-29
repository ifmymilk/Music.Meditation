//
//  PlayerView.swift
//  Music Meditation
//
//  Created by Simon LE on 13/06/2022.
//

import SwiftUI

struct PlayerView: View {
    
    @State var press: Bool = false
    @State private var isEditing = false
    @EnvironmentObject var audioManager: AudioManager
    var meditationVM: MeditationViewModel
    var isPreview: Bool = false
    
    @State var value: Double = 0.0
    @Environment(\.dismiss) var dismiss
    
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    
    
    var body: some View {
        ZStack {
            
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width:UIScreen.main.bounds.width)
                .ignoresSafeArea()
                
            
            
    
            VStack (spacing: 20) {
                
                HStack {
                    Button {
                        dismiss()
                        audioManager.stop()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.black)
                            .opacity(0.5)
                    }
                    Spacer()
                    
                }
                
                
                
                
                Text(meditationVM.meditation.title)
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                
                
                Spacer()
                
                if let player = audioManager.player {
                    Slider(value: $value, in: 0...player.duration)  { editing in
                        
                        print("editing")
                        isEditing = editing
                        
                        if !editing {
                            player.currentTime = value
                            
                        }
                        
                    }
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    .padding(.bottom, 6)
                    .padding(.top, 6)
                    
                    .background(Color.black)
                    .opacity(0.6)
                    .cornerRadius(30)
                    
                    // MARK: Playback Time
                    
                    HStack {
                        Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            .font(.headline)
                        
                        Spacer()
                        
                        Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                            .font(.headline)
                        
                    }
                    
                    // MARK: Playback Controls
                    
                    
                    
                    
                    HStack {
                        PlaybackControlButton(systemName: "repeat", color: press ? .red : .white) {
                            audioManager.toogleLoop()
                            press.toggle()
                        }
                        
                        Spacer()
                        
                        PlaybackControlButton(systemName: "gobackward.10") {
                            player.currentTime -= 10
                        }
                        Spacer()
                        
                        PlaybackControlButton(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill") {
                            audioManager.playPause()
                        }
                        Spacer()
                        PlaybackControlButton(systemName: "goforward.10") {
                            player.currentTime += 10
                        }
                        Spacer()
                        
                        PlaybackControlButton(systemName: "stop.fill") {
                            audioManager.stop()
                            dismiss()
                        }
                        
                        
                        
                    }
                    
                }
            }
            .padding(20)
            
        }
        .onAppear {
            audioManager.startPlayer(track: meditationVM.meditation.track, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else { return }
            value = player.currentTime
        }
    }
    
    
}


struct PlayerView_Previews: PreviewProvider {
    
    static let meditationVM = MeditationViewModel(meditation: Meditation.data.randomElement()!)
    static var previews: some View {
        PlayerView(meditationVM: meditationVM, isPreview: true)
            .environmentObject(AudioManager())
    }
}
