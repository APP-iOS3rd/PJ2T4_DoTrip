//
//  SearchView.swift
//  Dotrip
//
//  Created by Hee on 12/10/23.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var network = TourKoreaAPI.shared
    
    var body: some View {
        VStack {
            List {
                ForEach(network.posts, id: \.self) { data in
                    HStack {
                        AsyncImage(url: URL(string: data.firstimage ?? "")) { img in
                            img.image?.resizable()
//                            img.image?.frame(width: 80, height: 80)
//                            img.image?.scaledToFit()
                        }
                        .frame(width: 80, height: 80)
                        .scaledToFit()
                        
                        VStack {
                            Text("\(data.title)")
                            Text("\(data.eventstartdate)")
                        }
                        
                    }
                }
            }
        }
        .onAppear() {
            network.feachData()
        }
    }
}

//#Preview {
//    SearchView()
//}
