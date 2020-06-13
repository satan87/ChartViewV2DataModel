//
//  ChartData.swift
//  SwiftUICharts
//
//  Created by Nicolas Savoini on 2020-06-13.
//

import Foundation

public protocol randomize: class {
    func randomize()
}

public class DataModel: ObservableObject {
    @Published var data = [1.0, 1.0, 1.0]
}

public typealias Datable = DataModel & randomize

public class DerivedModel: Datable {
    
    public func randomize() {
        data[0] = Double.random(in: 0 ..< 10)
        data[1] = Double.random(in: 0 ..< 10)
        data[2] = Double.random(in: 0 ..< 10)
    }
}

public class MyModel: Datable {
    public func randomize() {
        data[0] = 1
        data[1] = 2
        data[2] = Double.random(in: 0 ..< 3)
    }
}
