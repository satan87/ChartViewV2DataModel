import SwiftUI

struct ChartTypeKey: EnvironmentKey {
    static let defaultValue: AnyChartType = AnyChartType(BarChart())
    //AnyChartType(LineChart())
}

struct ChartStyleKey: EnvironmentKey {
    static let defaultValue: ChartStyle = ChartStyle(backgroundColor: .white,
                                                     foregroundColor: ColorGradient(ChartColors.orangeDark,
                                                                                    ChartColors.orangeBright))
}
