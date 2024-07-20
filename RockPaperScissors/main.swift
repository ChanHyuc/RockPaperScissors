private func playGame() {
    
    while true {
        let randomNumber = (1...3).shuffled()
        print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
        
        guard let userInput = readLine().flatMap({ Int($0) }) else { return }
        
        if userInput == 0 {
            break;
        } else if randomNumber[0] == userInput {
            print("비겼습니다!")
        } else if randomNumber[0] == 1 && userInput == 2 || randomNumber[0] == 2 && userInput == 3 || randomNumber[0] == 3 && userInput == 1 {
            print("이겼습니다!")
        } else if randomNumber[0] == 1 && userInput == 3 || randomNumber[0] == 2 && userInput == 1 || randomNumber[0] == 3 && userInput == 2 {
            print("졌습니다!")
        } else {
            print("잘못된 입력입니다.")
        }
        
    }
}

playGame()
