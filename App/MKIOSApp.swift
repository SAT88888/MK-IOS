import SwiftUI
import SwiftData

@main
struct MKIOSApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: [
            TradeRecordEntity.self,
            ReviewEntity.self,
            WatchListEntity.self,
            PortfolioEntity.self,
            PositionEntity.self
        ])
    }
}
