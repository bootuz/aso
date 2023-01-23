//
//  AVPlayer.swift
//  Kartuli
//
//  Created by Астемир Бозиев on 17.01.2023.
//

import Foundation
import AVFoundation

extension AVPlayer {
    static func preparedPlayer(with letter: String) -> AVPlayer {
        guard let url = Bundle.main.url(forResource: letter, withExtension: "m4a") else {
            fatalError("Failed to find sound file.")
        }
        return AVPlayer(url: url)
    }
}
