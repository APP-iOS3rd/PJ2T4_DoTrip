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
                    NavigationLink(destination: SBIceAmericanoView(productDetail: sbIceAmericano)) {
                        Text("아이스 아메리카노 T")
                    }
                    NavigationLink(destination: SBIceLatteView()) {
                        Text("아이스 라떼 T")
                    }
                }
                
                Section(header: Text("투썸플레이스")) {
                    NavigationLink(destination: TPIceAmericanoView()) {
                        Text("아이스 아메리카노 R")
                    }
                    NavigationLink(destination: TPIceLatteView()) {
                        Text("아이스 라떼 R")
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
