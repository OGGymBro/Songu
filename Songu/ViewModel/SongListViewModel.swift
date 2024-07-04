//
//  SongListViewModel.swift
//  Songu
//
//  Created by Joaquim Menezes on 04/07/24.
//

import Foundation

class SongListViewModel: ObservableObject {
    @Published var songs = [Song]()
    
    func fetchSongs() async throws {
        let urlString = Constants.baseUrl + Endpoints.songs
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
    }
}
