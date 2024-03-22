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
            name: "Ace",
            image: Image(systemName: "person.circle"),
            status: Status()
        ),
        User(
            id: NSUUID().uuidString,
            name: "Onve",
            image: Image(systemName: "person.fill.checkmark"),
            status: Status()
        ),
        User(
            id: NSUUID().uuidString,
            name: "Kumi",
            image: Image(systemName: "person.fill.questionmark"),
            status: Status()
        ),
        User(
            id: NSUUID().uuidString,
            name: "Nana",
            image: Image(systemName: "person.fill.badge.plus"),
            status: Status()
        ),
        User(
            id: NSUUID().uuidString,
            name: "Teo",
            image: Image(systemName: "person.circle"),
            status: Status()
        ),
        User(
            id: NSUUID().uuidString,
            name: "Joy",
            image: Image(systemName: "person.badge.shield.checkmark"),
            status: Status()
        ),
    ]
}
