import Foundation

private func isValidUserNumber() -> GameElement? {
    guard let userInput = readLine().flatMap({ Int($0) }), userInput >= 0 && userInput <= 3 else {
        return nil
    }
    
    guard let userNumber = GameElement(rawValue: userInput) else { return nil }
    
    return userNumber
}

private func playGame() {
    
    while true {
        var currentTurn: PlayerTurn
        guard let randomNumber = GameElement(rawValue: Int.random(in: 1...3)) else { return }
        print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
        
        guard let userNumber = isValidUserNumber() else {
            print("잘못된 입력입니다.")
            continue
        }
        
        if userNumber == .terminator {
            break
        } else if randomNumber == userNumber {
            print("컴퓨터: \(randomNumber)")
            print("사용자: \(userNumber)")
            print("비겼습니다!")
            continue
        } else if (randomNumber == .rock && userNumber == .paper) ||
                    (randomNumber == .paper && userNumber == .scissors) ||
                    (randomNumber == .scissors && userNumber == .rock) {
            print("컴퓨터: \(randomNumber)")
            print("사용자: \(userNumber)")
            print("이겼습니다!")
            currentTurn = .user
        }
        else {
            print("컴퓨터: \(randomNumber)")
            print("사용자: \(userNumber)")
            print("졌습니다!")
            currentTurn = .computer
        }
        
        while true {
            print("[\(currentTurn) 턴] 묵(1), 찌(2), 빠(3)!<종료 : 0> :", terminator: " ")
            
            guard let userNumber = isValidUserNumber() else {
                print("잘못된 입력입니다.")
                continue
            }
            
            if userNumber == .terminator {
                break
            } else if randomNumber == userNumber {
                print("컴퓨터: \(randomNumber)")
                print("사용자: \(userNumber)")
                currentTurn == .user ? print("사용자의 승리!") : print("컴퓨터의 승리!")
                break
            } else if (randomNumber == .rock && userNumber == .paper) ||
                        (randomNumber == .paper && userNumber == .scissors) ||
                        (randomNumber == .scissors && userNumber == .rock) {
                print("컴퓨터: \(randomNumber)")
                print("사용자: \(userNumber)")
                print("사용자의 턴입니다.")
                currentTurn = .user
            }
            else {
                print("컴퓨터: \(randomNumber)")
                print("사용자: \(userNumber)")
                print("컴퓨터의 턴입니다.")
                currentTurn = .computer
            }
        }
        
        
    }
}

playGame()
