//
//  VaccinesData.swift
//  3amPetPlanner
//
//  Created by Vijayaganapathy Pavithraa on 9/8/24.
//

import Foundation
import UserNotifications

struct Vaccines: Identifiable {
    let id = UUID()
    var title: String = ""
    var vaccineTaken: String
}
