//
//  SearchView.swift
//  Dotrip
//
//  Created by Hee on 12/11/23.
//

import SwiftUI

struct SearchView: View {
    
    // 지역코드 조회
    @StateObject var network = TourKoreaAPI.shared
    
    var body: some View {
        VStack {
            List {
                ForEach(network.posts, id: \.contentid) { data in
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
            network.feachData(stringAddr: "서울시 종로구")
        }
    }
}

//#Preview {
//    SearchView()
//}
