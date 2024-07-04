//
//  AddUpdateSongViewModel.swift
//  Songu
//
//  Created by Joaquim Menezes on 04/07/24.
//

import Foundation

final class AddUpdateSongViewModel:ObservableObject {
    @Published var songTitle = ""
    
    var songID:UUID?
    
    var isUpdating:Bool {
        songID != nil
    }
    
    var buttonTitle:String {
        songID != nil ? "Update Song" : "Add Song"
    }
    
    init() {}
    
    init(currentSong: Song) {
        self.songTitle = currentSong.title
        self.songID = currentSong.id
    }
    
    func addSong() async throws {
        let urlString = Constants.baseUrl + Endpoints.songs
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let song = Song(id: nil, title: songTitle)
    }
}
