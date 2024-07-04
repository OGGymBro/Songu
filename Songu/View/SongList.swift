//
//  ContentView.swift
//  Songu
//
//  Created by Joaquim Menezes on 04/07/24.
//

import SwiftUI

struct SongList: View {
    
    @StateObject var viewModel = SongListViewModel()
    
    @State var modal: ModalType? = nil
    
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
            .toolbar {
                Button {
                    print("added")
                } label: {
//                    Image(systemName: "plus")
//                        .font(.title2)
                    Label("Add song",systemImage: "plus")
                        .font(.title2)
                }
            }
        }
        .sheet(item: $modal,
               onDismiss: {
            //on dismiss code
        }) {
            modal in
//            switch _modal {
//            case .add:
//                print("Add song")
//            case .update(let song):
//                print("Update song")
//            }
        }
        
        .onAppear{
            
            Task {
                do {
                    try await viewModel.fetchSongs()
                }
                catch {
                    print("🫠 Error: \(error)")
                }
            }
        }
    }
}

#Preview {
    SongList()
}
