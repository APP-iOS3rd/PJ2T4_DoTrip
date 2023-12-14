//
//  CameraButtonView.swift
//  Dotrip
//
//  Created by 유지인 on 12/11/23.
//

import SwiftUI

struct CameraButtonView: View {
    @Binding var showActionSheet : Bool
    @Binding var btnStatus :Bool
    
    var body: some View {
            Button {
                self.showActionSheet.toggle()
                btnStatus = true
            } label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.black)
                        .font(.system(size: 80))
                        .frame(width: 330,height: 350)
                        .background(Color.gray)
                        .cornerRadius(20)
                        .opacity(0.1)
                    Text("여기를 클릭 해주세요!")
                        .font(.subheadline)
                        .foregroundStyle(Color.gray)
                        .fontWeight(.medium)
                        .opacity(0.7)
                        .offset(x:0,y: 40)
                    
                    Image(systemName:"camera")
                        .foregroundColor(.black)
                        .font(.system(size: 50))
                        .opacity(0.1)
                }
        }
    }
}
    

#Preview {
    CameraButtonView(showActionSheet: .constant(false), btnStatus: .constant(true))
}

