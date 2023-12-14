//
//  FastFoodView.swift
//  Dotrip
//
//  Created by 이현호 on 12/13/23.
//

import SwiftUI

struct FastFoodView: View {
    var body: some View {
        List {
            Section(header: Text("롯데리아")) {
                Text("롯데리아 모바일상품권 1만원")
                Text("롯데리아 모바일상품권 5만원")
            }
            
            Section(header: Text("맥도날드")) {
                Text("맥도날드 모바일 기프티콘 1만원권")
                Text("맥도날드 모바일 기프티콘 3만원권")
            }
            .listStyle(.plain)
        }
        .navigationTitle("패스트푸드")
    }
}

#Preview {
    FastFoodView()
}
