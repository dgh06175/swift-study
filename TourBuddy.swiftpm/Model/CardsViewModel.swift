//
//  SwiftUIView.swift
//  
//
//  Created by 이상현 on 3/22/24.
//

import SwiftUI

// 데이터 구조를 직접 업데이트 하고 카드 스택에 사용하기 위함. 카드 스택을 스와이프 해서 삭제하여 렌더링을 조절하기 위함
// @Published 어노테이션을 적용하려면 ObservableObject 프로토콜을 준수해야한다.
class CardsViewModel: ObservableObject {
    // @Published 어노테이션: 값이 변경되면 알림을 울려 다른 곳에서 알아챌 수 있게 함
    @Published var cardModels = [Card]()
    @Published var buttonSwipeAction: SwipeAction? // O, X 버튼 작동 위한 변수

    private let service: CardService
    
    init(service: CardService) {
        self.service = service
        Task { await fetchCardModels() }
    }
    
    func fetchCardModels() async {
        do {
            self.cardModels = try await service.fetchCardModels()
        } catch {
            print("[ERROR] fetchCardModels error: \(error)")
        }
    }
    
    func removeCard(_ card: Card) {
        guard let index = cardModels.firstIndex(where: { $0.id == card.id }) else { return }
        cardModels.remove(at: index)
    }
}
