//
//  SearchView.swift
//  Dotrip
//
//  Created by Hee on 12/11/23.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var network = TourKoreaAPI.shared
//    @StateObject var eventInfo = EventInfoAPI.shared
    
    var body: some View {
        VStack {
            List {
                ForEach(network.posts, id: \.self) { data in
                    NavigationLink(destination: EventDetailView(contentId: data.contentid, contentTypeId: data.contenttypeid)) {
                        HStack {
                            AsyncImage(url: URL(string: data.firstimage ?? "")) { img in
                                img.image?.resizable()
                            }
                            .frame(width: 80, height: 80)
                            .scaledToFit()
                            
                            VStack(alignment: .leading) {
                                Text(data.title)
                                Text("\(data.addr1) \(data.addr2)")
                            }
                            
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
