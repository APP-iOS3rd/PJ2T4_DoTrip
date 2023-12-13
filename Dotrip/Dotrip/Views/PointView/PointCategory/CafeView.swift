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
                ForEach(cafeMenu) { coffee in
                    NavigationLink(coffee.title, value: coffee.price)
                }
            }
        }
    }
}

#Preview {
    CafeView()
}
