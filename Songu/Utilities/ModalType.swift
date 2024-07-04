//
//  ModalType.swift
//  Songu
//
//  Created by Joaquim Menezes on 04/07/24.
//

import Foundation

enum ModalType: Identifiable {
    var id:String {
        switch self {
        case .add: return "add"
        case .update: return "update"
        }
    }
    
    case add
    case update(Song)
}
