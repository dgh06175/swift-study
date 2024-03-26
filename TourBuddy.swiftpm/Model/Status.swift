//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

// 유저 또는 카드의 에너지 돈 모험 계획력 정보
struct Status: Hashable{
    var energy: Int = 0
    var money: Int = 0
    var adventure: Int = 0
    var plan: Int = 0
    
    func getSum() -> Int {
        return energy + money + adventure + plan
    }
    
    static func mockStatus() -> Status {
        return Status(
            energy: Int.random(in: -12...12),
            money: Int.random(in: -12...12),
            adventure: Int.random(in: -12...12),
            plan: Int.random(in: -12...12)
        )
    }
}
