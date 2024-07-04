//
//  AddUpdateSong.swift
//  Songu
//
//  Created by Joaquim Menezes on 04/07/24.
//

import SwiftUI

struct AddUpdateSong: View {
    
    @ObservedObject var viewModel: AddUpdateSongViewModel
    
    var body: some View {
        VStack{
            TextField("song Title",text: $viewModel.songTitle)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button {
                
            } label: {
                Text(viewModel.buttonTitle)
            }
        }
    }
}

#Preview {
    AddUpdateSong(viewModel: AddUpdateSongViewModel())
}
