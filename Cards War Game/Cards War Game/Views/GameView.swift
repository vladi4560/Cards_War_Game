

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel: GameViewModel
    
    
    
    init(isWest: Bool, name: String){
        _viewModel = StateObject(wrappedValue: GameViewModel(isWest: isWest,name: name))
    }
    var body: some View {
        
        ZStack {
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                if(viewModel.isWest){
                    
                    
                    HStack{
                        Text(viewModel.playerName).font(.headline).padding()
                        Text("\(viewModel.playerScore)")
                        
                        Image("icon").resizable().frame(width: 200,height: 200)
                        
                        Text("CPU").font(.headline).padding()
                        Text("\(viewModel.cpuScore)")
                    }
                    HStack{
                        Spacer()
                        Image(viewModel.playerCard).resizable().frame(width: 100,height: 150)
                        Spacer()
                        
                        
                        
                        Spacer()
                        Image(viewModel.cpuCard).resizable().frame(width: 100,height: 150)
                        Spacer()
                        
                        
                    }.padding(.bottom,50)
                    
                }else{
                    HStack{
                        Text("CPU").font(.headline).padding()
                        
                        Text("\(viewModel.cpuScore)")
                        
                        Image("icon").resizable().frame(width: 200,height: 200)
                        
                        Text(viewModel.playerName).font(.headline).padding()
                        Text("\(viewModel.playerScore)")
                    }
                    HStack{
                        Spacer()
                        Image(viewModel.cpuCard).resizable().frame(width: 100,height: 150)
                        
                        Spacer()
                        Image(viewModel.playerCard).resizable().frame(width: 100,height: 150)
                        Spacer()
                        
                    }.padding(.bottom,20)}
                
            }
            NavigationLink(destination: GameOverView(winner: viewModel.winner ,score: viewModel.winnerScore),isActive: $viewModel.isGameOver){}.hidden()
        }.onAppear(perform: viewModel.startGame)
        
        
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(isWest:false,name:"Vlad")
        //.previewDevice("iPhone 14 Pro")
            .previewInterfaceOrientation(.landscapeRight)
    }
}

