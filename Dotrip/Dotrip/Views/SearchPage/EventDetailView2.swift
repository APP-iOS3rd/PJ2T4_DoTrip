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
    
    let data: Item
    
    
    let contentId: String
    let contentTypeId: String
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    Text(data.title)
                        .font(.system(size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    AsyncImage(url: URL(string: data.firstimage ?? "")) { img in
                        img.image?.resizable()
                            .cornerRadius(10)
                            .frame(width: 280, height: 180)
                        
                        // 이부분이 AsyncImage( 안에 들어가야 되는 이유는??
                        // 안들어가면 동작이 안됨
                        VStack(alignment: .leading, spacing: 10) {
                            if !eventInfo.isLoading {
                                ScrollView {
                                    
                                    ForEach(eventInfo.infoPosts, id: \.self) { result in
                                        HStack{
                                            Text("행사 기간 : ")
                                                .fontWeight(.bold)
                                                .padding(.leading,10)
                                            Text("\(result.eventstartdate) ~ \(result.eventenddate)")
                                            Spacer()
                                        }
                                        .font(.system(size: 16))
                                        HStack{
                                            Text("개장 시간 : ")
                                                .fontWeight(.bold)
                                                .padding(.leading,10)
                                            Text("\(result.playtime.escapingHTML)")
                                            Spacer()
                                        }
                                        .font(.system(size: 16))
                                        HStack{
                                            Text("입장료 : ")
                                                .fontWeight(.bold)
                                                .padding(.leading,10)
                                            Text("\(result.usetimefestival.escapingHTML)")
                                            Spacer()
                                        }
                                        .font(.system(size: 16))
                                        .multilineTextAlignment(.leading)
                                    }
                                    .padding(1)
                                    
                                    
                                    ExpandableText(text: eventInfo.introPosts[0].infotext.escapingHTML)
                                        .font(.system(size: 16))
                                        .foregroundColor(.primary)
                                        .lineLimit(4)
                                        .expandButton(TextSet(text: "더보기", font: .system(size: 14), color: .blue))
                                        .collapseButton(TextSet(text: "접기", font: .system(size: 14), color: .blue))
                                        .expandAnimation(.easeOut)
                                        .padding(.horizontal, 24)
                                    
                                    
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
                                        
                                        
                                        Button("미션 하러 가기") {
                                            isMyMissionlistViewActive = true
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
