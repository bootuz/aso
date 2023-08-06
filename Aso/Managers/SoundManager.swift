//
//  SoundManager.swift
//  Aso
//
//  Created by Астемир Бозиев on 06.08.2023.
//

import Foundation
import AVKit


class SoundManager {

    static let shared = SoundManager()
    private let serialQueue = DispatchQueue(label: "SoundQueue", qos: .userInitiated)
    private var player: AVAudioPlayer?

    private init() {
        try? AVAudioSession.sharedInstance().setCategory(.playback)
        try? AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
    }

    func play(sound: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "m4a") else { return }

        do {
            try serialQueue.sync {
                self.player = try AVAudioPlayer(contentsOf: url)
                self.player?.prepareToPlay()
                self.player?.play()
            }
        } catch let error {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }

    func play(sound: String, delay: Double) {
        DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
            self.play(sound: sound)
        }
    }
}
