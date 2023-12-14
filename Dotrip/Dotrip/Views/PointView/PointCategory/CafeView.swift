//
//  CafeView.swift
//  Dotrip
//
//  Created by 이현호 on 12/13/23.
//

import SwiftUI

struct CafeView: View {
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("스타벅스")) {
                    NavigationLink(destination: ProductDetailView(productDetail: sbIceAmericano)) {
                        Text("아이스 아메리카노 T")
                    }
                    NavigationLink(destination: ProductDetailView(productDetail: sbIceLatte)) {
                        Text("아이스 라떼 T")
                    }
                }
                
                Section(header: Text("투썸플레이스")) {
                    NavigationLink(destination: ProductDetailView(productDetail: tsIceAmericano)) {
                        Text("ICE 아메리카노 R")
                    }
                    NavigationLink(destination: ProductDetailView(productDetail: tsIceLatte)) {
                        Text("ICE 카페라떼 R")
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("카페")
    }
}

#Preview {
    CafeView()
}
