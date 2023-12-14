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
    @State private var isLoading = false
    
    // [*시작날짜, 끝날짜, *지역코드, 시군구, *키워드].   * 지역코드와 키워드의 값이 일치해야함
    var params = ["20231201", "20231231", "39", "", "제주"]
    
    var body: some View {
        ZStack {
            VStack {
                Text("총 \(network.totalCount)개의 데이터")
                List {
                    ForEach(network.posts, id: \.self) { data in
                        NavigationLink(destination: EventDetailView2(contentId: data.contentid, contentTypeId: data.contenttypeid)) {
                            
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
            
            if network.isLoading {
                LoadingView()
            }
        }
        .onAppear() {
            network.feachData(params: params)
        }
    }
}

//#Preview {
//    SearchView()
//}
