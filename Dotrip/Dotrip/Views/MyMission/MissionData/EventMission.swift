//
//  EventMission.swift
//  Dotrip
//
//  Created by 김혜란 on 12/15/23.
//

import UIKit
import SwiftUI


struct EventMission: View {
    // 미션 데이터 배열 선언
    var missionData: [Mission] = []

    init() {
        // 미션 데이터 초기화
        let eventMission1 = Mission(id: "1", name: "미션 1", address: "주소 1", description: "설명 1", image: "이미지 1")
        let eventMission2 = Mission(id: "2", name: "미션 2", address: "주소 2", description: "설명 2", image: "이미지 2")
        let eventMission3 = Mission(id: "3", name: "미션 3", address: "주소 3", description: "설명 3", image: "이미지 3")
        let eventMission4 = Mission(id: "4", name: "미션 4", address: "주소 4", description: "설명 4", image: "이미지 4")

        missionData = [eventMission1, eventMission2, eventMission3, eventMission4]
    }

    var body: some View {
        Text("Hello, SwiftUI!")
    }
}
