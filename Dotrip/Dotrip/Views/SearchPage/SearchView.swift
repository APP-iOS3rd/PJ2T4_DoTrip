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
    var params: [String]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("총")
                        .font(.system(size: 13))
                    Text("\(network.totalCount)")
                        .foregroundStyle(Color.pointColor)
                        .font(.system(size: 13))
                        .padding(.leading, -5)
                        .bold()

                    Text("개 항목이 있습니다.")
                        .font(.system(size: 13))
                        .padding(.leading, -5)

                }
                List {
                    ForEach(network.posts, id: \.self) { data in
                        NavigationLink(destination: EventDetailView2(data: data, contentId: data.contentid, contentTypeId: data.contenttypeid)) {
                            
                            HStack {
                                AsyncImage(url: URL(string: data.firstimage ?? "")) { img in
                                    img.image?.resizable()
                                }
                                .frame(width: 65, height: 65)
                                .cornerRadius(5)
                                .scaledToFit()
                                
                                VStack(alignment: .leading) {
                                    Text(data.title)
                                        .font(.system(size: 15))
                                        .bold()
                                        .padding(.bottom, 3)
                                        .lineLimit(1)
                                    Text("\(data.addr1) \(data.addr2)")
                                        .font(.system(size: 13))
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
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
