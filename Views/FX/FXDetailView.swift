import SwiftUI

struct FXDetailView: View {
    let result: MKAnalyzerOutput

    var body: some View {
        List {
            Section("総合判定") {
                HStack {
                    Text(result.symbol)
                    Spacer()
                    Text(result.decision.rawValue).bold()
                }
                ScoreBadgeView(score: result.totalScore, label: "score")
                if let direction = result.direction {
                    Text("方向：\(direction.rawValue)")
                }
            }

            Section("根拠") {
                if result.reasons.isEmpty {
                    Text("根拠なし")
                } else {
                    ForEach(result.reasons, id: \.self) { Text($0) }
                }
            }

            Section("注意") {
                if result.cautions.isEmpty {
                    Text("大きな注意なし")
                } else {
                    ForEach(result.cautions, id: \.self) { Text($0) }
                }
            }
        }
        .navigationTitle(result.symbol)
    }
}
