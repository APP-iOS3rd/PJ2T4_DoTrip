
import SwiftUI

struct MapMissionDetailView: View {
    
    @StateObject var missionStore : MissionStore
    @Binding var missions : Mission
    
    
    var body: some View {
        ZStack(alignment:.center){
           
            VStack(alignment:.leading, spacing: 0){
                Spacer()
                VStack(alignment:.leading, spacing: 0){
                    Text("\(missions.name)")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.bottom,7)
                    Text("미션내용:\(missions.description)")
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                    Text("주소: \(missions.address)")
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                    
                }.position(x: 195 , y:60)
                
                Button {
                    
                } label: {
                    Text("미션 하러 가기")
                        .fontWeight(.regular)
                        .frame(width:250, height: 50)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius:2, x:0, y:2)
                }
                .position(x: 195 , y:15)
            }
        }
        .onAppear{ }
    }

    

}

