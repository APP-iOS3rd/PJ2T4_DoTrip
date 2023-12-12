//
//  MapDetailView.swift
//  Dotrip
//
//  Created by jonghyun baik on 12/11/23.
//

import SwiftUI

struct MapDetailView: View {
    
    var place : Place
    var body: some View {
        VStack {
            Text(place.title)
                .bold()
                .padding(10)
            Text(place.addr1)
                .font(.footnote)
                .padding(10)
            Rectangle()
                .frame(width: 300, height: 200)
                .padding(10)
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Text("미션하러 가기")
                }
                .tint(.white)
                .background(.blue)
                Spacer()
            }
            .buttonStyle(.bordered)

        }
    }
}

//#Preview {
//    MapDetailView()
//}
