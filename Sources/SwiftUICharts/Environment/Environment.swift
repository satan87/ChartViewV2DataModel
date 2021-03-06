import SwiftUI

extension EnvironmentValues {
    var chartType: AnyChartType {
        get {
            return self[ChartTypeKey.self]
        }
        set {
            self[ChartTypeKey.self] = newValue
        }
    }

    var chartStyle: ChartStyle {
        get {
            return self[ChartStyleKey.self]
        }
        set {
            self[ChartStyleKey.self] = newValue
        }
    }
}
