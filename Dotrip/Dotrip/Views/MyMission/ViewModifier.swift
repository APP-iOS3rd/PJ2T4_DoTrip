//
//  Modified.swift
//  Dotrip
//
//  Created by 유지인 on 12/14/23.
//


import SwiftUI

//미션 카운트
struct CountModify: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 350, height: 30)
            .background(Color(hex: 0xEFECEC))
            .cornerRadius(20)
            .offset(x:0, y:50)
    }
}
//미션리스트
struct ListModify:ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(width: 350, height: 70)
            .foregroundStyle(Color.white)
            .cornerRadius(20)
            .shadow(radius:2, x:0, y:2)
    }
}


//미션리스트
struct ImageModify:ViewModifier{
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: 330,height: 350)
            .cornerRadius(20)
    }
}


//공용버튼
struct ButtonModify:ViewModifier{
    func body(content: Content) -> some View {
        content
            .fontWeight(.regular)
            .frame(width:150, height: 50)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius:2, x:0, y:2)
    }
}

//오렌지 버튼
struct ButtonOrangeModify:ViewModifier{
    func body(content: Content) -> some View {
        content
            .fontWeight(.regular)
            .frame(width: 150, height: 50)
            .foregroundColor(.white)
            .background(Color(hex: 0xFFA800))
            .cornerRadius(10)
            .shadow(radius: 2, x: 0, y: 2)
    }
}



