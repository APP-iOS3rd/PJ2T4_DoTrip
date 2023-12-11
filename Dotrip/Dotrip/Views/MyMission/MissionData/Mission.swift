//
//  Mission.swift
//  Dotrip
//  * 예시용 json 구조체로 변환*
//  Created by 유지인 on 12/11/23.
//

import SwiftUI

struct Mission: Codable,Identifiable  {
    
    var id : String
    let name: String
    let address: String
    let description: String
    let image: String

}

