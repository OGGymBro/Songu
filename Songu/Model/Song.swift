//
//  Song.swift
//  Songu
//
//  Created by Joaquim Menezes on 04/07/24.
//

import Foundation

struct Song: Identifiable,Codable {
    let id: UUID?
    var title: String
}
