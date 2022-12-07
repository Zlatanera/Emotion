//
//  StatsViewModel.swift
//  Emotion
//
//  Created by Владислав Бороздин on 31.10.2022.
//

import SwiftUI
import SwiftUICharts

class StatsViewModel: ObservableObject {
    
    @Published var data : LineChartData?
    
    init() {
//        data = weekOfData()
    }
    
    func load(items: [Notes]) {
        let points = items.map({ $0.makeChartDataPoint() })
        let data = LineDataSet(dataPoints: points)
        
        let gridStyle  = GridStyle(numberOfLines: 6,
                                   lineColour   : Color(.lightGray).opacity(0.5),
                                   lineWidth    : 1,
                                   dash         : [8],
                                   dashPhase    : 0)
        
        let chartStyle = LineChartStyle(infoBoxPlacement    : .infoBox(isStatic: false),
                                        infoBoxBorderColour : Color.primary,
                                        infoBoxBorderStyle  : StrokeStyle(lineWidth: 1),
                                        
                                        markerType          : .vertical(attachment: .line(dot: .style(DotStyle()))),
                                        
                                        xAxisGridStyle      : gridStyle,
                                        xAxisLabelPosition  : .bottom,
                                        xAxisLabelColour    : Color.primary,
                                        xAxisLabelsFrom     : .dataPoint(rotation: .degrees(0)),
                                        
                                        yAxisGridStyle      : gridStyle,
                                        yAxisLabelPosition  : .leading,
                                        yAxisLabelColour    : Color.primary,
                                        yAxisNumberOfLabels : 6,
                                        
                                        baseline            : .minimumWithMaximum(of: 0),
                                        topLine             : .maximum(of: 5),
                                        
                                        globalAnimation     : .easeOut(duration: 1))
        
        self.data = LineChartData(dataSets: data, chartStyle: chartStyle)
        
    }
    
    func weekOfData() -> LineChartData {
            let data = LineDataSet(dataPoints: [
                LineChartDataPoint(value: 12000, xAxisLabel: "M", description: "Monday"),
                LineChartDataPoint(value: 10000, xAxisLabel: "T", description: "Tuesday"),
                LineChartDataPoint(value: 8000,  xAxisLabel: "W", description: "Wednesday"),
                LineChartDataPoint(value: 17500, xAxisLabel: "T", description: "Thursday"),
                LineChartDataPoint(value: 16000, xAxisLabel: "F", description: "Friday"),
                LineChartDataPoint(value: 11000, xAxisLabel: "S", description: "Saturday"),
                LineChartDataPoint(value: 9000,  xAxisLabel: "S", description: "Sunday")
            ],
            legendTitle: "Steps",
            pointStyle: PointStyle(),
            style: LineStyle(lineColour: ColourStyle(colour: .red), lineType: .curvedLine))
            
            let metadata   = ChartMetadata(title: "Step Count", subtitle: "Over a Week")
            
            let xAxisLabels: [String] = data.dataPoints.map({ $0.xAxisLabel ?? "ПОН" })
        
            let gridStyle  = GridStyle(numberOfLines: 7,
                                       lineColour   : Color(.lightGray).opacity(0.5),
                                       lineWidth    : 1,
                                       dash         : [8],
                                       dashPhase    : 0)
            
            let chartStyle = LineChartStyle(infoBoxPlacement    : .infoBox(isStatic: false),
                                            infoBoxBorderColour : Color.primary,
                                            infoBoxBorderStyle  : StrokeStyle(lineWidth: 1),
                                            
                                            markerType          : .vertical(attachment: .line(dot: .style(DotStyle()))),
                                            
                                            xAxisGridStyle      : gridStyle,
                                            xAxisLabelPosition  : .bottom,
                                            xAxisLabelColour    : Color.primary,
                                            xAxisLabelsFrom     : .dataPoint(rotation: .degrees(0)),
                                            
                                            yAxisGridStyle      : gridStyle,
                                            yAxisLabelPosition  : .leading,
                                            yAxisLabelColour    : Color.primary,
                                            yAxisNumberOfLabels : 7,
                                            
                                            baseline            : .minimumWithMaximum(of: 5000),
                                            topLine             : .maximum(of: 20000),
                                            
                                            globalAnimation     : .easeOut(duration: 1))
            
            return LineChartData(dataSets: data,
                                 metadata: metadata,
                                 xAxisLabels: xAxisLabels,
                                 chartStyle: chartStyle)
            
    }
}

extension Notes {
    
    func makeChartDataPoint() -> LineChartDataPoint {
        LineChartDataPoint(value: Double(self.emotion), description: self.task, date: self.timestamp)
    }
    
}
