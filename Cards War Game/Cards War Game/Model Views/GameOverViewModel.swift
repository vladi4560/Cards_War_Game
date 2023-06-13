

import Foundation

class GameOverViewModel: ObservableObject{
    
    @Published  var winnerName = ""
    @Published  var winnerScore = ""
    @Published  var isReturn = false
    
    
    init(winner: String, score: Int){
        winnerName = "Winner " + winner
        winnerScore = "Score " + String(score)
        isReturn = false
    }
    
    func backToMenu(){
        isReturn = true
    }
}
