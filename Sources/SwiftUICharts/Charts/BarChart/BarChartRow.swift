import SwiftUI

//struct BarChartRow: View {
public struct BarChartRow<Datable>: View where Datable: DataModel & randomize {
    
    //@State var data: [Double] = []
    
    @ObservedObject var model: Datable
    
    @State var touchLocation: CGFloat = -1.0

    //enum Constant {
        //static let spacing: CGFloat = 16.0
    let spacing: CGFloat = 16.0
    //}

    var style: ChartStyle
    
    var maxValue: Double {
        guard let max = model.data.max() else {
            return 1
        }
        return max != 0 ? max : 1
    }

    public var body: some View {
        
        VStack {
            GeometryReader { geometry in
                HStack(alignment: .bottom,
                       spacing: (geometry.frame(in: .local).width - self.spacing) / CGFloat(self.model.data.count * 3)) {
                    ForEach(0..<self.model.data.count, id: \.self) { index in
                        BarChartCell(model: self.model,
                                     index: index,
                                     width: Float(geometry.frame(in: .local).width - self.spacing),
                                     numberOfDataPoints: self.model.data.count,
                                     gradientColor: self.style.foregroundColor.rotate(for: index),
                                     touchLocation: self.$touchLocation)
                            .scaleEffect(self.getScaleSize(touchLocation: self.touchLocation, index: index), anchor: .bottom)
                            .animation(.spring())
                        
                    }
                }
                .padding([.top, .leading, .trailing], 10)
                .gesture(DragGesture()
                    .onChanged({ value in
                        self.touchLocation = value.location.x/geometry.frame(in: .local).width
                    })
                    .onEnded({ value in
                        self.touchLocation = -1
                    })
                )
            }
            
            Button(action: {
                self.model.randomize()
            }) {
                Text("R BCC")
            }
        }
    }
    
    func normalizedValue(index: Int) -> Double {
        return Double(model.data[index])/Double(maxValue)
    }

    func getScaleSize(touchLocation: CGFloat, index: Int) -> CGSize {
        if touchLocation > CGFloat(index)/CGFloat(self.model.data.count) &&
            touchLocation < CGFloat(index+1)/CGFloat(self.model.data.count) {
            return CGSize(width: 1.4, height: 1.1)
        }
        return CGSize(width: 1, height: 1)
    }
    
}


struct BarChartRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BarChartRow(model: DerivedModel(), style: styleGreenRed)
            /*
            Group {
                BarChartRow(data: [1, 2, 3], style: styleGreenRed)
                BarChartRow(data: [1, 2, 3], style: styleGreenRedWhiteBlack)
            }
            Group {
                BarChartRow(data: [1, 2, 3], style: styleGreenRed)
                BarChartRow(data: [1, 2, 3], style: styleGreenRedWhiteBlack)
            }.environment(\.colorScheme, .dark)*/
        }
    }
}

private let styleGreenRed = ChartStyle(backgroundColor: .white, foregroundColor: .greenRed)

/*
struct BarChartRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BarChartRow(data: [0], style: styleGreenRed)
            Group {
                BarChartRow(data: [1, 2, 3], style: styleGreenRed)
                BarChartRow(data: [1, 2, 3], style: styleGreenRedWhiteBlack)
            }
            Group {
                BarChartRow(data: [1, 2, 3], style: styleGreenRed)
                BarChartRow(data: [1, 2, 3], style: styleGreenRedWhiteBlack)
            }.environment(\.colorScheme, .dark)
        }
    }
}

private let styleGreenRed = ChartStyle(backgroundColor: .white, foregroundColor: .greenRed)

private let styleGreenRedWhiteBlack = ChartStyle(
    backgroundColor: ColorGradient.init(.white),
    foregroundColor: [ColorGradient.redBlack, ColorGradient.whiteBlack])

*/
