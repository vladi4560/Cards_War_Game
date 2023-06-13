//
//  GameOverView.swift
//  Cards War Game
//
//  Created by Student18 on 13/06/2023.
//

import SwiftUI


struct GameOverView: View {
    
    @StateObject var viewModel: GameOverViewModel
    
    
    init(winner: String, score: Int){
        _viewModel = StateObject(wrappedValue: GameOverViewModel(winner: winner,score: score))
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            Image("Gameover")
            Spacer()
            Text(viewModel.winnerName)
            Spacer()
            Text(viewModel.winnerScore)
            Spacer()
            Button("Back To Menu",action: viewModel.backToMenu).buttonStyle(.borderedProminent)
            Spacer()
            
            
            NavigationLink(destination: EnterView(viewModel: EnterViewModel()),isActive: $viewModel.isReturn){}.hidden()
        }
        .padding()
        
        
    }
    
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(winner: "Vladi",score: 0)
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}
