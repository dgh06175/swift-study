//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

// 질문 카드 한 장의 정보
struct Card: Identifiable, Hashable {
    let id: String
    let question: String
    let status: Status
}

// 최소 0점, 최대 12점
let cards: [Card] = [
        Card(
            id: NSUUID().uuidString,
              question: "나는 관광보다 휴양을 선호한다.",
            status: Status(
                energy: 0,
                money: 3,
                adventure: 0,
                plan: 1
                )
            ),
        Card(
            id: NSUUID().uuidString,
            question: "호텔 조식은 무조건 먹어야지!",
            status: Status(
                energy: 3,
                money: 0,
                adventure: 0,
                plan: 5
            )
        ),
        Card(
            id: NSUUID().uuidString,
            question: "나는 처음 보는 외국인들과 대화하는것을 좋아한다.",
            status: Status(
                energy: 3,
                money: 0,
                adventure: 4,
                plan: 0
            )
        ),
        Card(
            id: NSUUID().uuidString,
            question: "나는 여행지에서 돈을 아끼지 않는다.",
            status: Status(
                energy: 0,
                money: 4,
                adventure: 2,
                plan: 1
            )
        ),
        Card(
            id: NSUUID().uuidString,
            question: "처음 보는 음식점에 들어가는것을 좋아한다.",
            status: Status(
                energy: 3,
                money: 0,
                adventure: 4,
                plan: 0
            )
        ),
        Card(
            id: NSUUID().uuidString,
            question: "관광, 휴양 보다는 액티비티가 좋다",
            status: Status(
                energy: 2,
                money: 3,
                adventure: 2,
                plan: 0
            )
        ),
        Card(
            id: NSUUID().uuidString,
            question: "나는 여행 전에 여행지 맛집을 알아보고 간다",
            status: Status(
                energy: 1,
                money: 2,
                adventure: 0,
                plan: 5
            )
        ),
    ]
