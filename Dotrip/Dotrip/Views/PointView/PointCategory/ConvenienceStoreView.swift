//
//  ConvenienceStoreView.swift
//  Dotrip
//
//  Created by 이현호 on 12/13/23.
//

import SwiftUI

struct ConvenienceStoreView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("GS25")) {
                    NavigationLink(destination: ProductDetailView(productDetail: gsGift5)) {
                        Text("모바일 상품권 5천원권")
                    }
                    NavigationLink(destination: ProductDetailView(productDetail: gsGift10)) {
                        Text("모바일 상품권 1만원권")
                    }
                }
                
                Section(header: Text("CU")) {
                    NavigationLink(destination: ProductDetailView(productDetail: cuGift5)) {
                        Text("모바일 금액권 5,000원")
                    }
                    NavigationLink(destination: ProductDetailView(productDetail: cuGift10)) {
                        Text("모바일 금액권 10,000원")
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("편의점")
    }
}

#Preview {
    ConvenienceStoreView()
}
