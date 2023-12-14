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
    //    @StateObject var network = TourKoreaAPI.shared
    @StateObject var missionStore = MissionStore(missions: missionData)
    
    @State private var showMoreText = false
    //    @State private var sampleText: String?
    //    @State private var sampleText2: String?
    @State private var mission: String?
    @State private var isMyMissionlistViewActive = false
    
    let eventMissionData = EventMission()
    
    let data: Item
    let contentId: String
    let contentTypeId: String
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack(alignment: .leading) {
                    Text(data.title)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    
                    AsyncImage(url: URL(string: data.firstimage ?? "")) { img in
                        img.image?.resizable()
                            .cornerRadius(10)
                            .frame(width: 300, height: 180)
                        
                        // 이부분이 AsyncImage( 안에 들어가야 되는 이유는??
                        // 안들어가면 동작이 안됨
                        VStack(alignment: .leading, spacing: 10) {
                            if !eventInfo.isLoading {
                                ScrollView {
                                    ForEach(eventInfo.infoPosts, id: \.self) { result in
                                        VStack{
                                            HStack{
                                                Text("행사 기간")
                                                    .fontWeight(.bold)
                                                    .padding(.leading,10)
                                                Spacer()
                                            }
                                            HStack{
                                                Text("\(result.eventstartdate) ~ \(result.eventenddate)")
                                                Spacer()
                                            }
                                            .padding(.leading,10)
                                        }
                                        .font(.system(size: 16))
                                        .padding(2)
                                        
                                        VStack{
                                            HStack{
                                                Text("개장 시간")
                                                    .fontWeight(.bold)
                                                    .padding(.leading,10)
                                                Spacer()
                                            }
                                            HStack{
                                                Text("\(result.playtime.escapingHTML)")
                                                Spacer()
                                            }
                                            .padding(.leading,10)
                                        }
                                        .font(.system(size: 16))
                                        .padding(2)
                                        
                                        VStack{
                                            HStack{
                                                Text("입장료")
                                                    .fontWeight(.bold)
                                                    .padding(.leading,10)
                                                Spacer()
                                            }
                                            HStack{
                                                Text("\(result.usetimefestival.escapingHTML)")
                                                Spacer()
                                            }
                                            .padding(.leading, 10)
                                        }
                                        .font(.system(size: 16))
                                        .multilineTextAlignment(.leading)
                                        .padding(2)
                                    }
                                    .padding(1)
                                    
                                    
                                    ExpandableText(text: eventInfo.introPosts[0].infotext.escapingHTML)
                                        .font(.system(size: 16))
                                        .foregroundColor(.primary)
                                        .lineLimit(4)
                                        .expandButton(TextSet(text: "더보기", font: .system(size: 14), color: .blue))
                                        .collapseButton(TextSet(text: "접기", font: .system(size: 14), color: .blue))
                                        .expandAnimation(.easeOut)
                                        .padding(.horizontal, 11)
                                    
                                    
                                    
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text(data.title)
                                                .font(.title3)
                                        }
                                        .fontWeight(.bold)
                                        .padding()
                                        
//                                                                    contentid: "2778088" 관악
//                                                                    contentid: "3035607" 광화문 광장
//                                                                    contentid: "406745" 난타
                                        
                                        if eventInfo.introPosts[0].contentid == "2785797" {
                                            Text(eventMissionData.missionData[0].description)
                                                .font(.system(size: 16))
                                                .padding(1)
                                                .padding(.leading, 10)
                                        }
                                        
                                        if eventInfo.introPosts[0].contentid == "2778088" {
                                            Text(eventMissionData.missionData[1].description)
                                                .font(.system(size: 16))
                                                .padding(1)
                                                .padding(.leading, 10)
                                        }
                                        
                                        if eventInfo.introPosts[0].contentid == "3035607"  {
                                            Text(eventMissionData.missionData[2].description)
                                                .font(.system(size: 16))
                                                .padding(1)
                                                .padding(.leading, 10)
                                        }
                                        
                                        if eventInfo.introPosts[0].contentid == "406745"  {
                                            Text(eventMissionData.missionData[3].description)
                                                .font(.system(size: 16))
                                                .padding(1)
                                                .padding(.leading, 10)
                                        }
                                        
                                        
                                        Button("미션 하러 가기") {
                                            isMyMissionlistViewActive = true
                                            //                                            print(contentTypeId)
                                        }
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color(hex: 0xFFA800))
                                        .cornerRadius(10)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        
                                        .fullScreenCover(isPresented: $isMyMissionlistViewActive, content: {
                                            NavigationView {
                                                MyMissionListView()
                                                    .navigationBarTitle("내 미션", displayMode: .inline)
                                                    .navigationBarItems(trailing: Button("닫기") {
                                                        isMyMissionlistViewActive = false
                                                    })
                                            }
                                        })
                                        
                                    }
                                    .background(Color(hex: 0xF4F4F4))
                                    .cornerRadius(10)
                                    .padding()
                                    Spacer()
                                    
                                }
                            }
                        }
                        .padding(2)
                        
                        
                    }
                }
                if eventInfo.isLoading {
                    LoadingView()
                }
            }
        }
        .padding()
        .onAppear() {
            eventInfo.getInfoData(contentID: contentId, contentType: contentTypeId)
            eventInfo.getIntroData(contentID: contentId, contentType: contentTypeId)
            //            if let firstPost = eventInfo.introPosts.first { sampleText = firstPost.infotext }
        }
        .navigationTitle("행사 정보")
        
    }
}



//#Preview {
//    EventDetailView2(data: <#Item#>, contentId: "3021116", contentTypeId: "15")
//}
