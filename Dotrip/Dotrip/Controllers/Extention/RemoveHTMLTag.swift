//
//  RemoveHTMLTag.swift
//  Dotrip
//
//  Created by Hee on 12/12/23.
//

import Foundation

extension String {
    var escapingHTML: String {
        let patten = "<[^>]+>|&quot;|<b>|</b>" // 필요한 패턴을 |(or기호)와 함꼐 추가하기
        
        return self.replacingOccurrences(of: patten,
                                  with: "",
                                  options: .regularExpression,
                                  range: nil)
    }
}
