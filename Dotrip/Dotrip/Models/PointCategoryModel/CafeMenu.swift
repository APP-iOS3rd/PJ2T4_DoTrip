//
//  CafeModel.swift
//  Dotrip
//
//  Created by 이현호 on 12/13/23.
//

import Foundation

struct CafeMenu: Identifiable,Hashable {
    var id: String {"\(title)"}
    let title: String
    let description: String
    let point: String
}

let cafeMenu: [CafeMenu] = [
    CafeMenu(title: "아이스 아메리카노",
             description: "시원한 아이스 아메리카노",
             point: "450p"
            ),
    CafeMenu(title: "아이스 라떼",
             description: "시원한 아이스 라떼",
             point: "500p"
            )
]

