

import SwiftUI


@main
struct Cards_War_GameApp: App {
    @StateObject var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            EnterView(viewModel: EnterViewModel())
                .environmentObject(locationManager)
        }
    }
}
