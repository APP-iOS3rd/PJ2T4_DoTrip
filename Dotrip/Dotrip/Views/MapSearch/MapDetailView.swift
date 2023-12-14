//mapDetailView

import SwiftUI

struct MapDetailView: View {
    
    @StateObject var eventInfo = EventInfoAPI.shared

    let contentId: String
    let contentTypeId: String
    
    @Binding var cont : Item?
    
    @ObservedObject var navigationManager: NavigationManager
    
    var body: some View {
        ZStack {
            VStack {
                
                AsyncImage(url: URL(string: cont?.firstimage ?? "")) { img in
                            img.image?.resizable()
                        }
                        .frame(width: 150, height: 150)
                        .scaledToFit()
                        .padding(.bottom, 20)
                        
                
                ForEach(eventInfo.infoPosts, id: \.self) { result in
                    VStack(alignment: .leading) {
                        Text(cont?.title ?? "")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("\(cont?.addr1 ?? "") \(cont?.addr2 ?? "")")
                            .padding(.bottom, 10)
                        Text("행사 기간: \(result.eventstartdate)~\(result.eventenddate)")
                        Text("개장 시간: \(result.playtime.escapingHTML)")
                    }
                }
            }
            
            VStack{
                Spacer()
                Button {
                    navigationManager.stackPath = .EventDetailView
                    
                } label: {
                    Text("행사 정보 확인")
                }
                .buttonStyle(BorderedButtonStyle())
                .background(.blue)
                .foregroundStyle(.white)

            }
        }
        .padding(5)
        .onAppear() {
            eventInfo.getInfoData(contentID: contentId, contentType: contentTypeId)
        }
    }
}

//#Preview {
//    EventDetailView()
//}
