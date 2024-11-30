//
//  CustomImages.swift
//  Morse
//
//  Created by Dmytro Ryshchuk on 11/30/24.
//

import SwiftUI

enum CustomImages: String {
    case ellipsisCircle = "ellipsis.circle"
    case waveform = "waveform"
    case listBullet = "list.bullet"
    case house = "house"
    case antennaRadiowavesLeftAndRight = "antenna.radiowaves.left.and.right"
    
    var image: Image {
        Image(systemName: self.rawValue)
    }
}
