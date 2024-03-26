//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

struct MockData {
    static let users: [User] = [
        User(
            id: NSUUID().uuidString,
            name: "에이스",
            image: Image("ace"),
            status: Status()
        ),
        User(
            id: NSUUID().uuidString,
            name: "온브",
            image: Image("onve"),
            status: Status()
        ),
        User(
            id: NSUUID().uuidString,
            name: "쿠미",
            image: Image("kumi"),
            status: Status()
        ),
        User(
            id: NSUUID().uuidString,
            name: "나나",
            image: Image("nana"),
            status: Status()
        ),
        User(
            id: NSUUID().uuidString,
            name: "테오",
            image: Image("teo"),
            status: Status()
        ),
        User(
            id: NSUUID().uuidString,
            name: "조이",
            image: Image("joy"),
            status: Status()
        ),
    ]
}
