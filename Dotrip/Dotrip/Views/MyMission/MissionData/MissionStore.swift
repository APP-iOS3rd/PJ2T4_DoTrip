//
//  MissionStore.swift
//  Dotrip
//
//  Created by 유지인 on 12/11/23.
//

import Foundation

class MissionStore: ObservableObject{
    @Published var missions: [Mission]
    
    init(missions: [Mission]) {
        self.missions = missions
    }
}
