//
//  ContentView.swift
//  Songu
//
//  Created by Joaquim Menezes on 04/07/24.
//

import SwiftUI

struct SongList: View {
    
    @StateObject var viewModel = SongListViewModel()
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(viewModel.songs) { song in
                    Button {
                        print("selected song is :\(song.title)")
                    } label: {
                        Text("\(song.title)")
                            .font(.title3)
                            .foregroundStyle(.primary)
                    }
                }
            }
            .navigationTitle(Text("Songs🎶 "))
        }
    }
}

#Preview {
    SongList()
}
