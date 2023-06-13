

import SwiftUI

struct EnterView: View {
    @EnvironmentObject var locationManager: LocationManager
    @ObservedObject var viewModel: EnterViewModel
    
    
    @State var name: String = ""
    var body: some View {
        NavigationView{
            HStack{
                if(viewModel.isNameExist && viewModel.isWest){
                    Image("West").resizable().frame(width: 250,height: 250).padding(.top,45)
                }
                
                Spacer()
                VStack {
                    Spacer()
                    Text(viewModel.title)
                    Spacer()
                    Text(viewModel.errorMessage).foregroundColor(.red)
                    Spacer()
                    TextField("Enter you name...",text: $viewModel.name).padding(.top,50).multilineTextAlignment(.center).onSubmit {
                        viewModel.enterName(long: locationManager.location?.coordinate.longitude ?? 0.0)
                    }
                    Spacer()
                    Button("Start Game",action: viewModel.startGame).buttonStyle(.borderedProminent)
                    Spacer()
                }
                .padding()
                Spacer()
                if(viewModel.isNameExist && !viewModel.isWest){
                    Image("East").resizable().frame(width: 250,height: 250)
                }
                NavigationLink(destination: GameView(isWest: viewModel.isWest,name: viewModel.name),isActive: $viewModel.isReadyToPlay){}.hidden()
            }
        }
    }
}


struct EnterView_Previews: PreviewProvider {
    static var previews: some View {
        EnterView(viewModel: EnterViewModel())
            .previewInterfaceOrientation(.landscapeRight)
            .environmentObject(LocationManager())
            
    }
}
