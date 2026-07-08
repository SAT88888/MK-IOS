import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            NavigationStack {
                List {
                    Section("Decision Center") {
                        Text("MK-IOS Ver.20 Final")
                        Text("条件成立まで待機。無理に入らない。")
                    }
                    Section("Build Check") {
                        Text("Codemagic Simulator Build Ready")
                    }
                }
                .navigationTitle("MK-IOS")
            }
            .tabItem { Label("Home", systemImage: "house") }

            NavigationStack { Text("FX") .navigationTitle("FX") }
                .tabItem { Label("FX", systemImage: "chart.line.uptrend.xyaxis") }

            NavigationStack { Text("Stock") .navigationTitle("Stock") }
                .tabItem { Label("Stock", systemImage: "building.2") }

            NavigationStack { Text("Journal") .navigationTitle("Journal") }
                .tabItem { Label("Journal", systemImage: "book") }

            NavigationStack { Text("Capital") .navigationTitle("Capital") }
                .tabItem { Label("Capital", systemImage: "yensign.circle") }
        }
    }
}
