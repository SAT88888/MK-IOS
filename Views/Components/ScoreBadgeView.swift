import SwiftUI

struct ScoreBadgeView: View {
    let score: Int
    let label: String

    var body: some View {
        VStack(spacing: 4) {
            Text("\(score)")
                .font(.title2.bold())
            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(10)
        .frame(minWidth: 72)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
