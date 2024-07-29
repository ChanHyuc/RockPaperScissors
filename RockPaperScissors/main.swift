import Foundation

private func isValidUserNumber() -> GameElement? {
    guard let userInput = readLine().flatMap({ Int($0) }), userInput >= 0 && userInput <= 3 else {
        return nil
    }
    
    guard let userNumber = GameElement(rawValue: userInput) else { return nil }
    
    return userNumber
}

private func determineWinner(randomNumber: GameElement, userNumber: GameElement) -> PlayerTurn? {
    if randomNumber == userNumber {
        return nil
    } else if (randomNumber == .rock && userNumber == .paper) ||
                (randomNumber == .paper && userNumber == .scissors) ||
                (randomNumber == .scissors && userNumber == .rock) {
        return .user
    } else {
        return .computer
    }
}

private func playRockPaperScissors() -> PlayerTurn? {
    guard let randomNumber = GameElement(rawValue: Int.random(in: 1...3)) else { return nil }
    
    print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
    
    guard let userNumber = isValidUserNumber() else {
        print("잘못된 입력입니다.")
        return nil
    }
    
    if userNumber == .terminator {
        return nil
    }
    
    print("컴퓨터: \(randomNumber)")
    print("사용자: \(userNumber)")
    
    if randomNumber == userNumber {
        print("비겼습니다!")
        return nil
    }
    
    let winner = determineWinner(randomNumber: randomNumber, userNumber: userNumber)
    
    if winner == .user {
        print("이겼습니다!")
    } else {
        print("졌습니다!")
    }
    
    return winner
}

private func playMukJjiPpa(initialTurn: PlayerTurn) {
    var currentTurn = initialTurn
    
    while true {
        print("[\(currentTurn.rawValue) 턴] 묵(1), 찌(2), 빠(3)!<종료 : 0> :", terminator: " ")
        
        guard let randomNumber = GameElement(rawValue: Int.random(in: 1...3)) else { return }
        guard let userNumber = isValidUserNumber() else {
            print("잘못된 입력입니다.")
            continue
        }
        
        if userNumber == .terminator {
            break
        }
        
        print("컴퓨터: \(randomNumber)")
        print("사용자: \(userNumber)")
        
        if randomNumber == userNumber {
            currentTurn == .user ? print("사용자의 승리!") : print("컴퓨터의 승리!")
            break
        }
        
        let winner = determineWinner(randomNumber: randomNumber, userNumber: userNumber)
        
        if winner == .user {
            print("사용자의 턴입니다.")
            currentTurn = .user
        } else {
            print("컴퓨터의 턴입니다.")
            currentTurn = .computer
        }
    }
}

private func playGame() {
    while true {
        if let initialTurn = playRockPaperScissors() {
            playMukJjiPpa(initialTurn: initialTurn)
        }
    }
}

playGame()
