//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

// 유저의 정보
struct User: Identifiable {
    let id: String
    var name: String
    var image: Image
    var status: Status
}
