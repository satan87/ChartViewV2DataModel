import SwiftUI

//public struct BarChartCell: View {
public struct BarChartCell<Datable>: View where Datable: DataModel & randomize {
    
    //@State var value: Double
    @ObservedObject var model: Datable
    
    @State var index: Int = 0
    @State var width: Float
    @State var numberOfDataPoints: Int
    var gradientColor: ColorGradient

    var cellWidth: Double {
        return Double(width)/(Double(numberOfDataPoints) * 1.5)
    }

    @State var scaleValue: Double = 0
    @Binding var touchLocation: CGFloat
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(gradientColor.linearGradient(from: .bottom, to: .top))
            }
            .frame(width: CGFloat(self.cellWidth))
        .scaleEffect(CGSize(width: 1, height: self.model.data[index] / Double(self.model.data.max() ?? 1)), anchor: .bottom)
        .animation(Animation.spring().delay(self.touchLocation < 0 ?  Double(self.index) * 0.04 : 0))
    }
}

struct BarChartCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BarChartCell(model: MyModel(), width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.greenRed, touchLocation: .constant(CGFloat()))
        }
    }
}

/*
struct BarChartCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BarChartCell(value: 0, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.greenRed, touchLocation: .constant(CGFloat()))
            Group {
                BarChartCell(value: 1, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.greenRed, touchLocation: .constant(CGFloat()))
                BarChartCell(value: 1, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.whiteBlack, touchLocation: .constant(CGFloat()))
                BarChartCell(value: 1, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient(.purple), touchLocation: .constant(CGFloat()))
            }
            
            Group {
                BarChartCell(value: 1, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.greenRed, touchLocation: .constant(CGFloat()))
                BarChartCell(value: 1, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.whiteBlack, touchLocation: .constant(CGFloat()))
                BarChartCell(value: 1, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient(.purple), touchLocation: .constant(CGFloat()))
            }.environment(\.colorScheme, .dark)
        }
        
    }
}
*/


