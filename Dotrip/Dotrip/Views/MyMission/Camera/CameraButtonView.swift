//
//  CameraButtonView.swift
//  Dotrip
//
//  Created by 유지인 on 12/11/23.
//
//
import SwiftUI

struct CameraButtonView: View {
    @Binding var showActionSheet : Bool
    @State var btnStatus = false
    
    var body: some View {
        Button(action: {
            self.showActionSheet.toggle()
            btnStatus = true
        }){
            if btnStatus == false {
                VStack{
                    Image("경복궁사진1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 330,height: 350)
                        .cornerRadius(20)
                        .offset(x:0,y: -40)
                    
                    Text("미션 시작하기")
                        .fontWeight(.regular)
                        .frame(width:250, height: 50)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius:2, x:0, y:2)
                    
                }
            }else{
                VStack{
                    Rectangle()
                        .foregroundColor(.gray)
                        .opacity(0.1)
                        .frame(width: 330,height: 350)
                        .cornerRadius(20)
                        .offset(x:0,y: -40)
                    
                    Text("미션 중")
                        .fontWeight(.regular)
                        .frame(width:250, height: 50)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .shadow(radius:2, x:0, y:2)
                    
                }
//            Button(action: {
//               
//            }) {
//                Text("미션 포기하기")
//                    .fontWeight(.regular)
//                    .frame(width:250, height: 50)
//                    .foregroundColor(.black)
//                    .background(Color.white)
//                    .cornerRadius(10)
//                    .shadow(radius:2, x:0, y:2)
//            }.offset(x:0,y: 40)
            }
        }
    }
        
}
 

#Preview { CameraButtonView(showActionSheet: .constant(false))
       .previewLayout(.sizeThatFits)
     
}
