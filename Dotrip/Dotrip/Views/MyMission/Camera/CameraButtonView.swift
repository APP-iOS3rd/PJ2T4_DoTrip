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
            if btnStatus == false {
                VStack(spacing:0){
                    Image("경복궁사진1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 330,height: 350)
                        .cornerRadius(20)
                        .padding(.bottom,30)
                    
                    Text("미션 시작하기")
                        .fontWeight(.regular)
                        .frame(width:250, height: 50)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius:2, x:0, y:2)
                    

                }
            }else{
                VStack(spacing:0){
                    Rectangle()
                        .foregroundColor(.gray)
                        .opacity(0.1)
                        .frame(width: 330,height: 350)
                        .cornerRadius(20)
                        .padding(.bottom,30)
                
                    
                    Text("미션중")
                        .fontWeight(.regular)
                        .frame(width:250, height: 50)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .shadow(radius:2, x:0, y:2)

                }
            }
        }
    }
    
}
#Preview {
    CameraButtonView(showActionSheet: .constant(false), btnStatus: .constant(true))
}
