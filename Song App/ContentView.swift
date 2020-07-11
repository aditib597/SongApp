//
//  ContentView.swift
//  Song App
//
//  Created by Aditi on 6/19/20.
//  Copyright © 2020 Aditi. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
   @State var song: AVAudioPlayer?
    @State var songArray = ["Beatit.m4a", "Speechless.m4a", "YouandMe.m4a"]
    
    var body: some View {
        NavigationView {
            VStack {
            Text("Welcome to the SONG APP!").font(Font.custom("MarkerFelt-Wide", size: 30)).foregroundColor(Color.pink)
            Image("dj").resizable().aspectRatio(contentMode: .fit).padding()
            HStack {
            Button(action: {
                self.playSound(soundNumber: 1)
                           }) {
                Image("cd").resizable().aspectRatio(contentMode: .fit)
                           }
                Button(action: {
                self.playSound(soundNumber: 2)
                           }) {
                Image("cd").resizable().aspectRatio(contentMode: .fit)
                           }
            Button(action: {
                self.playSound(soundNumber: 3)
                           }) {
            Image("cd").resizable().aspectRatio(contentMode: .fit)
                           }
                       }
                NavigationLink(destination: AboutTheAppView()) {
                    Text("Go to the next screen.").font(Font.custom("MarkerFelt-Wide", size: 30))
                }
                
            }.navigationBarTitle("Song App").font(Font.custom("MarkerFelt-Wide", size: 30))
                  
        }
       
}

    func playSound(soundNumber : Int) {
             
        let path = Bundle.main.path(forResource: songArray[soundNumber - 1], ofType:nil)!
        let url = URL(fileURLWithPath: path)


               do {
                   song = try AVAudioPlayer(contentsOf: url)
                   song?.play()
               } catch {
                  
               }
           }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
