//
//  StatsViewModel.swift
//  Emotion
//
//  Created by Владислав Бороздин on 31.10.2022.
//

import SwiftUI
import SwiftUICharts

class StatsViewModel: ObservableObject {
    
    @Published var lineData : LineChartData?
    @Published var pieData : PieChartData?
    
    init() {
//        data = weekOfData()
    }
    
    func load(items: [Notes]) {
        
        makeLineChartData(items: items)
        makePieChartData(items: items)
    }
    
    func weekOfData() {
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
            
        self.lineData = LineChartData(dataSets       : data,
                                 metadata       : metadata,
                                 chartStyle     : chartStyle)
            
        }
}

extension StatsViewModel {
    
    func makePieChartData(items: [Notes]) {
        
        var dictEmoCount: [Emotion.Smile:Int] = [:]
        items.forEach({
            let emotion = Emotion.Smile.getEmotionFor(id: $0.emotion)
            let count = dictEmoCount[emotion] ?? 0
            dictEmoCount[emotion] = count + 1
        })
        
        let dataPoints: [PieChartDataPoint] = dictEmoCount.map({
            PieChartDataPoint(value: Double($0.value), description: nil, date: nil, colour: $0.key.color, label: .none)
            
        })
        
        let pieDataSet = PieDataSet(dataPoints: dataPoints, legendTitle: "Count")
        let metaData = ChartMetadata()
        
        
        self.pieData = PieChartData(dataSets: pieDataSet, metadata: metaData)
        
    }
    
    func makeLineChartData(items: [Notes]) {
        
        let points = items.map({ $0.makeChartDataPoint() })
        let data = LineDataSet(dataPoints: points,
                style: LineStyle(lineColour: ColourStyle(colour: .red), lineType: .curvedLine))
            
        
        let gridStyle  = GridStyle(numberOfLines: 6,
                                   lineColour   : Color(.lightGray).opacity(0.5),
                                   lineWidth    : 1,
                                   dash         : [8],
                                   dashPhase    : 0)
        
        let xAxisLabels = items.map({ $0.dayS })
        
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
        
        self.lineData = LineChartData(dataSets: data, chartStyle: chartStyle)
    }
    
}
