//
//  CameraButtonView.swift
//  Dotrip
//
//  Created by 유지인 on 12/11/23.
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
                Button(action: {
                    self.showActionSheet.toggle()
                    btnStatus = true
                }){
                    
                    Text("미션중")
                        .fontWeight(.regular)
                        .frame(width:250, height: 50)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .shadow(radius:2, x:0, y:2)
                }.offset(x:0,y: 180)
            }
        }
    }
        
        
        
        
//        Button(action: {
//            self.showActionSheet.toggle()
//            btnStatus = true
//        }) {
//            if btnStatus == false {
//                VStack{
//                    Image("경복궁사진1")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 350, height: 400)
//                        .cornerRadius(20)
//                        .padding(.vertical,40)
//                    
//                        Text("미션 시작")
//                            .fontWeight(.regular)
//                            .frame(width:250, height: 50)
//                            .foregroundColor(.black)
//                            .background(Color.white)
//                            .cornerRadius(10)
//                            .shadow(radius:4, x:0, y:4)
//                      
//             
//                }.offset(x:0, y: -290)
//                   
//            }else {
//                VStack{
//                    Text("미션완료")
//                        .fontWeight(.regular)
//                        .frame(width:250, height: 50)
//                        .foregroundColor(.white)
//                        .background(Color.orange)
//                        .cornerRadius(10)
//                        .shadow(radius:4, x:0, y:4)
//                        .offset(x:0, y: -45)
//                    
//                }
//
//            }
//            
//        }

       
    }
 

#Preview { CameraButtonView(showActionSheet: .constant(false))
       .previewLayout(.sizeThatFits)
     
}


//#Preview {
//    MyMissionCameraView()
//}
