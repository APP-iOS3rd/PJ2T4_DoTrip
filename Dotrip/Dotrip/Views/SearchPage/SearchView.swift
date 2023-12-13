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
    
    var params = ["20231201", "20231231", "39", ""]
    
    var body: some View {
        VStack {
            Text("총 \(network.totalCount)개의 데이터")
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
                
                ForEach(network.Keywordposts, id: \.self) { data in
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
            network.feachData(stringAddr: "서귀포시", params: params)
        }
    }
}

//#Preview {
//    SearchView()
//}
