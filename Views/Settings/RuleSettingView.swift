import SwiftUI

struct RuleSettingView: View {
    @AppStorage("newsFilterEnabled") private var newsFilterEnabled = true
    @AppStorage("boxMiddleNoEntryEnabled") private var boxMiddleNoEntryEnabled = true
    @AppStorage("spreadFilterEnabled") private var spreadFilterEnabled = true
    @AppStorage("rrMinimum") private var rrMinimum = 1.5

    var body: some View {
        NavigationStack {
            Form {
                Section("MK基本ルール") {
                    Toggle("重要指標フィルター", isOn: $newsFilterEnabled)
                    Toggle("BOX中央帯禁止", isOn: $boxMiddleNoEntryEnabled)
                    Toggle("スプレッド拡大フィルター", isOn: $spreadFilterEnabled)
                }

                Section("資金管理") {
                    Stepper("最低RR：1:\(rrMinimum, specifier: "%.1f")", value: $rrMinimum, in: 1.0...3.0, step: 0.1)
                }
            }
            .navigationTitle("Settings")
        }
    }
}
