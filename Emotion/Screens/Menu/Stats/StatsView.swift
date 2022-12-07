//
//  StatsView.swift
//  Emotion
//
//  Created by Владислав Бороздин on 31.10.2022.
//

import SwiftUI
import SwiftUICharts

struct StatsView: View {
    
    @EnvironmentObject var coordinator: EmotionCoordinator
    @ObservedObject var viewModel = StatsViewModel()
    
    let items: [Notes]
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 20) {
                //MARK: HEADER
                HStack {
                    
                    Text("Статистика")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: coordinator.back) {
                        Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                    }
                }//:HSTACK
                .foregroundColor(.white)
                
            }//:VSTACK
            .padding()
            .background(AppColors.mainColor)
            
            if let data = viewModel.data {
                LineChart(chartData: data)
                    .pointMarkers(chartData: data)
                    .touchOverlay(chartData: data, specifier: "%.0f")
//                    .yAxisPOI(chartData: data,
//                              markerName: "Step Count Aim",
//                              markerValue: 15_000,
//                              labelPosition: .center(specifier: "%.0f"),
//                              labelColour: Color.black,
//                              labelBackground: Color(red: 1.0, green: 0.75, blue: 0.25),
//                              lineColour: Color(red: 1.0, green: 0.75, blue: 0.25),
//                              strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
//                    .yAxisPOI(chartData: data,
//                              markerName: "Minimum Recommended",
//                              markerValue: 10_000,
//                              labelPosition: .center(specifier: "%.0f"),
//                              labelColour: Color.white,
//                              labelBackground: Color(red: 0.25, green: 0.75, blue: 1.0),
//                              lineColour: Color(red: 0.25, green: 0.75, blue: 1.0),
//                              strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                    .averageLine(chartData: data,
                                 strokeStyle: StrokeStyle(lineWidth: 3, dash: [5,10]))
                    .xAxisGrid(chartData: data)
                    .yAxisGrid(chartData: data)
                    .xAxisLabels(chartData: data)
                    .yAxisLabels(chartData: data)
                    .infoBox(chartData: data)
                    .headerBox(chartData: data)
                    .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
                    .id(data.id)
                    .frame(minWidth: 150, maxWidth: 900, minHeight: 150, idealHeight: 250, maxHeight: 400, alignment: .center)
                }
                Spacer()
            }//:VSTACK
            .navigationTitle("Week of Data")
            .onAppear {
                viewModel.load(items: items)
            }
        
        }//:BODY
}//:STRUCT


struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(items: [])
    }
}
