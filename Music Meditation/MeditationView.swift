//
//  MeditationView.swift
//  Music Meditation
//
//  Created by Simon LE on 13/06/2022.
//

import SwiftUI

struct MeditationView: View {
    
    @EnvironmentObject  var audioManager: AudioManager
    @State var meditationVM: MeditationViewModel
    @State var showPlayer = false
    

    
    var body: some View {
        VStack(spacing: 0) {
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
            
            
            ZStack {
                Color(red: 24/255, green: 23/255, blue: 22/255)
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Music")
                            .textCase(.uppercase)
                            .opacity(0.7)
                        
                        Text("\(meditationVM.meditation.track)")
                        
//                        if let player = audioManager.player {
//                            Text(DateComponentsFormatter.positional.string(from: player.duration) ?? "0:00")
//                                .textCase(.uppercase)
//                                .opacity(0.7)
//                        }
                    }
                    
                    
                    
                    Text(meditationVM.meditation.title)
                        .font(.system(size: 24.0))
                    
                    
                    Button {
                        showPlayer = true
                    } label: {
                        Label("Play", systemImage: "play.fill")
                        
                        
                            .font(.system(.headline, design: .rounded))
                            .foregroundColor(.black)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                    }
                    
                    
                    if showPlayer {
                        PlayerView(meditationVM: meditationVM)
                    }
                    
                    Text(meditationVM.meditation.description)
                    
                    Spacer()
                    
                    Button {
                        let n = Int.random(in: 0...4)
                        meditationVM = MeditationViewModel(meditation: Meditation.data[n])
                    
                      
                    } label: {
                        Label("", systemImage: "infinity.circle")
                    }.font(.system(size: 40))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom)
                    
                    
                }
                .foregroundColor(.white)
                .padding(20)
                
                
              
            }
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
            
          
        }
        .animation(.spring(response: 0.8, dampingFraction: 0.6, blendDuration: 0), value: showPlayer)
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView(meditationVM: meditationVM)
        }
     
    }
        
}


struct MeditationView_Previews: PreviewProvider {
    static let meditationVM = MeditationViewModel(meditation:  Meditation.data.randomElement()!)
    static var previews: some View {
        MeditationView(meditationVM: meditationVM)
            .environmentObject(AudioManager())
    }
}
