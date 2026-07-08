import SwiftUI
import SwiftData

struct CapitalView: View {
    @Query private var portfolios: [PortfolioEntity]
    @Query private var positions: [PositionEntity]

    private var latestPortfolio: PortfolioEntity? {
        portfolios.sorted { $0.updatedAt > $1.updatedAt }.first
    }

    var body: some View {
        NavigationStack {
            List {
                Section("資金状況") {
                    Text("総資金：\(MKFormatters.yen(latestPortfolio?.totalCapital ?? 0))")
                    Text("現金残高：\(MKFormatters.yen(latestPortfolio?.cashBalance ?? 0))")
                    Text("実現損益：\(MKFormatters.yen(latestPortfolio?.realizedProfitLoss ?? 0))")
                    Text("含み損益：\(MKFormatters.yen(latestPortfolio?.unrealizedProfitLoss ?? 0))")
                }

                Section("保有ポジション") {
                    if positions.isEmpty {
                        Text("保有ポジションなし")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(positions) { position in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(position.symbol).font(.headline)
                                Text("\(position.direction.rawValue) / 建値 \(position.entryPrice, specifier: "%.3f")")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Capital")
        }
    }
}
