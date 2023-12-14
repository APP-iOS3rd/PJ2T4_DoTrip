//
//  LoadingView2.swift
//  Dotrip
//
//  Created by Hee on 12/14/23.
//

import SwiftUI

struct LoadingView2: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView2()
}
