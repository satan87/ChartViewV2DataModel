import SwiftUI

struct AnyChartType: ChartType {
    private let chartMaker: (Datable, ChartType.Style) -> AnyView

    init<S: ChartType>(_ type: S) {
        self.chartMaker = type.makeTypeErasedBody
    }
    /*
    func makeChart(configuration: ChartType.Configuration, style: ChartType.Style) -> AnyView {
        self.chartMaker(configuration, style)
    }*/
    
    func makeChart(configuration: Datable, style: ChartType.Style) -> AnyView {
        self.chartMaker(configuration, style)
    }
    
}

fileprivate extension ChartType {
    func makeTypeErasedBody(configuration: Datable, style: ChartType.Style) -> AnyView {
        AnyView(makeChart(configuration: configuration, style: style))
    }
}

