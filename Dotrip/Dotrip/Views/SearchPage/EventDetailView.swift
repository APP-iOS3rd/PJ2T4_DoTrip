//
//  EventDetailView.swift
//  Dotrip
//
//  Created by Hee on 12/11/23.
//

import SwiftUI

struct EventDetailView: View {
    
    @StateObject var eventInfo = EventInfoAPI.shared

    let contentId: String
    let contentTypeId: String
    
    var body: some View {
        ZStack {
            VStack {
                Divider()
                
                ForEach(eventInfo.infoPosts, id: \.self) { result in
                    Text("행사 기간: \(result.eventstartdate)~\(result.eventenddate)")
                    Text("개장 시간: \(result.playtime.escapingHTML)")
                    // <- html태그 제거 extension
                    // string값 뒤에 넣어주면 됩니다.
                    Text("입장료: \(result.usetimefestival.escapingHTML)")
                }
                
                Divider()
                
                ForEach(eventInfo.introPosts, id: \.self) { result in
                    // 행사소개가 행사소개글, 행사일정 두가지입니다.
                    Text("행사 소개: \(result.infotext.escapingHTML)")
                }
            }
            
            if eventInfo.isLoading {
                LoadingView2()
            }
        }
        .padding(20)
        .onAppear() {
            eventInfo.getInfoData(contentID: contentId, contentType: contentTypeId)
        }
    }
}

//#Preview {
//    EventDetailView()
//}
