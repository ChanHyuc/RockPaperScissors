enum RockPaperScissors: Int {
    case rock = 1
    case paper = 2
    case scissors = 3
}

enum TurnCheck: String {
    case user = "사용자"
    case computer = "컴퓨터"
}

private func playGame() {
    
    while true {
        var turn: TurnCheck
        guard let randomNumber = RockPaperScissors(rawValue: Int.random(in: 1...3)) else { return }
        print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
        
        guard let userInput = readLine().flatMap({ Int($0) }), userInput >= 0 && userInput <= 3 else {
            print("잘못된 입력입니다.")
            continue
        }
        
        guard let userNumber = RockPaperScissors(rawValue: userInput) else { return }
        
        if userInput == 0 {
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
            turn = .user
        }
        else {
            print("컴퓨터: \(randomNumber)")
            print("사용자: \(userNumber)")
            print("졌습니다!")
            turn = .computer
        }
        
        while true {
            print("[\(turn) 턴] 묵(1), 찌(2), 빠(3)!<종료 : 0> :", terminator: " ")
            
            guard let userInput = readLine().flatMap({ Int($0) }), userInput >= 0 && userInput <= 3 else {
                print("잘못된 입력입니다.")
                continue
            }
            
            guard let userNumber = RockPaperScissors(rawValue: userInput) else { return }
            
            if userInput == 0 {
                break
            }
            
            if randomNumber == userNumber {
                print("컴퓨터: \(randomNumber)")
                print("사용자: \(userNumber)")
                turn == .user ? print("사용자의 승리!") : print("컴퓨터의 승리!")
                break
            } else if (randomNumber == .rock && userNumber == .paper) ||
                        (randomNumber == .paper && userNumber == .scissors) ||
                        (randomNumber == .scissors && userNumber == .rock) {
                print("컴퓨터: \(randomNumber)")
                print("사용자: \(userNumber)")
                print("사용자의 턴입니다.")
                turn = .user
            }
            else {
                print("컴퓨터: \(randomNumber)")
                print("사용자: \(userNumber)")
                print("컴퓨터의 턴입니다.")
                turn = .computer
            }
        }
        
        
    }
}

playGame()
