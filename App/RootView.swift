import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            HomeView().tabItem { Label("Home", systemImage: "house") }
            FXListView().tabItem { Label("FX", systemImage: "chart.line.uptrend.xyaxis") }
            StockListView().tabItem { Label("Stock", systemImage: "building.2") }
            JournalListView().tabItem { Label("Journal", systemImage: "book") }
            CapitalView().tabItem { Label("Capital", systemImage: "yensign.circle") }
            RuleSettingView().tabItem { Label("Settings", systemImage: "gearshape") }
        }
    }
}
