//
//  File.swift
//  Dotrip
//
//  Created by 김혜란 on 12/13/23.
//

import SwiftUI
import ExpandableText


struct EventDetailView2: View {
    
    @StateObject var eventInfo = EventInfoAPI.shared
    @StateObject var network = TourKoreaAPI.shared
    @StateObject var missionStore = MissionStore(missions: missionData)
    
    @State private var showMoreText = false
    @State private var sampleText: String?
    @State private var mission: String?
    @State private var isMyMissionlistViewActive = false
    
    let data: Item
    
    
    let contentId: String
    let contentTypeId: String
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text(data.title)
                    .font(.system(size: 20))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                ForEach(eventInfo.infoPosts, id: \.self) { result in
                    HStack{
                        Text("행사 기간 : ")
                            .fontWeight(.bold)
                            .padding(.leading,10)
                        Text("\(result.eventstartdate) ~ \(result.eventenddate)")
                    }
                    .font(.system(size: 16))
                    HStack{
                        Text("개장 시간 : ")
                            .fontWeight(.bold)
                            .padding(.leading,10)
                        Text("\(result.playtime)")
                    }
                    .font(.system(size: 16))
                    HStack{
                        Text("입장료 : ")
                            .fontWeight(.bold)
                            .padding(.leading,10)
                        Text("\(result.usetimefestival)")
                    }
                    .font(.system(size: 16))
                    .multilineTextAlignment(.leading)
                }
                .padding(1)
                
                AsyncImage(url: URL(string: data.firstimage ?? "")) { img in
                    img.image?.resizable()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ScrollView {
                            ExpandableText(text: sampleText ?? "")
                                .font(.system(size: 14))
                                .foregroundColor(.primary)
                                .lineLimit(4)
                                .expandButton(TextSet(text: "더보기", font: .system(size: 14), color: .blue))
                                .collapseButton(TextSet(text: "접기", font: .system(size: 14), color: .blue))
                                .expandAnimation(.easeOut)
                                .padding(.horizontal, 24)
                        }
                    }
                    .padding(2)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(data.title)
                                .font(.title3)
                        }
                        .fontWeight(.bold)
                        .padding()
                        
                        Text("미션 내용이 들어갈 자리입니다.")
                            .font(.system(size: 16))
                            .padding(1)
                            .padding(.leading, 10)
                        
                        
                        //                        NavigationLink(destination: MyMissionListView(), isActive: $isMyMissionlistViewActive) {
                        //                            EmptyView()
                        //                        }
                        
                        Button("미션 하러 가기") {
                            isMyMissionlistViewActive = true
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(hex: 0xFFA800))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        .padding()
                        
                        
                    }
                    .background(Color(hex: 0xF4F4F4))
                    .cornerRadius(10)
                    .padding()
                    Spacer()
                }
            }
        }
        .padding()
        .onAppear() {
            eventInfo.getInfoData(contentID: contentId, contentType: contentTypeId)
            //            eventInfo.getIntroData(contentID: contentId, contentType: contentTypeId)
            if let firstPost = eventInfo.introPosts.first { sampleText = firstPost.infotext }
            
        }
        .navigationTitle("행사 정보")
        
    }
}



//#Preview {
//    EventDetailView2(data: <#Item#>, contentId: "3021116", contentTypeId: "15")
//}
