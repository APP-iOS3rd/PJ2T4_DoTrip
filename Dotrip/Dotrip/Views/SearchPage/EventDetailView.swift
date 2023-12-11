//
//  EventDetailView.swift
//  Dotrip
//
//  Created by Hee on 12/11/23.
//

import SwiftUI

struct EventDetailView: View {
    
    @StateObject var eventInfo = EventInfoAPI.shared
    @StateObject var eventIntro = IntroductionAPI.shared
    
    let contentId: String
    let contentTypeId: String
    
    var body: some View {
        VStack {
            Text("ContentID = \(contentId)")
            Text("ContentID = \(contentTypeId)")
            ForEach(eventInfo.posts, id: \.self) { result in
                Text("행사 기간 = \(result.eventstartdate)~\(result.eventenddate)")
                Text("개장 시간 = \(result.playtime)")
                Text("입장료 = \(result.usetimefestival)")
            }
            
            ForEach(eventIntro.posts, id: \.self) { result in
                Text("행사 소개: \(result.infotext)")
            }
        }
        .onAppear() {
            eventInfo.feachData(contentID: contentId, contentType: contentTypeId)
            eventIntro.feachData(contentID: contentId, contentType: contentTypeId)
        }
    }
}

//#Preview {
//    EventDetailView()
//}
