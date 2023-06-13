//
//  GameViewModel.swift
//  Cards War Game
//
//  Created by Student18 on 13/06/2023.
//

import Foundation

class GameViewModel: ObservableObject{
    
    @Published  var playerCard = "card7"
    @Published  var cpuCard = "card13"
    @Published  var playerScore = 0
    @Published  var cpuScore = 0
    @Published  var turns = 0
    
    @Published var isWest = false
    @Published var playerName = ""
    @Published var isGameOver = false
    @Published var winner = ""
    @Published var winnerScore = 0
    
    init(isWest: Bool, name: String){
        playerName = name
        self.isWest = isWest
    }
    
    func deal(){
        let playerCardNum = Int.random(in: 2...14)
        let cpuCardNum = Int.random(in: 2...14)
        
        playerCard = "card" + String(playerCardNum)
        
        cpuCard = "card" + String(cpuCardNum)
        checkScore(playerScore: playerCardNum,cpuScore: cpuCardNum)
        
        
    }
    func checkScore(playerScore: Int,cpuScore: Int){
        if playerScore > cpuScore {
            self.playerScore += 1
        } else if playerScore <=  cpuScore {
            self.cpuScore += 1
        }
    }
    
    func startGame() {
        var seconds = 0
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            
            if seconds % 5 == 0 {
                seconds = 0
                self?.turns += 1
                // Perform the action every 5 seconds
                self?.deal()
            }
            
            if self?.turns == 10 {
                self?.endGame()
                timer.invalidate()
                
            }
            
            seconds += 1
        }
    }
    
    func endGame(){
        if playerScore > cpuScore {
            winner = playerName
            winnerScore = playerScore
        }else {
            winner = "CPU"
            winnerScore = cpuScore
        }
        print("here")
        self.isGameOver = true
    }
}
