

import SwiftUI

class EnterViewModel: ObservableObject{
    @Published var constLongitude = 34.817549168324334
    @Published var name: String = ""
    @Published var title : String = "Welcome to Cards War Game"
    @Published var errorMessage: String = ""
    @Published var isNameExist = false
    @Published var isWest = false
    @Published var isReadyToPlay = false
    
    
    func enterName (long : Double){
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = " Please fill your name"
                return
        }
        errorMessage = ""
        title = "Welcome " + name
        isNameExist = true
        checkLandMarks(longitude: long)
    }
    
    func checkLandMarks(longitude: Double){
           if longitude < constLongitude{
               isWest = true
           }else{
               isWest = false
           }
       }
    
    func startGame(){
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = " Please fill your name"
                return
        }
        errorMessage = ""
        if(isNameExist){
            isReadyToPlay = true
        }
    }
}
