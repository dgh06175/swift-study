//
//  File.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

struct SizeConstants {
    static var cardWidth: CGFloat {
        250;
    }
    static var cardHeight: CGFloat {
        cardWidth / 3 * 4;
    }
    static var screenCutoff: CGFloat {
        cardWidth * 0.75;
    }
}
