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
        ScrollView(.vertical) {
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
                
                if let data = viewModel.lineData {
                    StatsLineChart(data: data)
                }
                
                if let data = viewModel.pieData {
                    StatsPieChart(data: data)
                }
                    
            }//:VSTACK
        }//:SCROLL
            .navigationTitle("Week of Data")
            .onAppear {
                viewModel.load(items: items)
//                viewModel.weekOfData()
            }
        
        }//:BODY
}//:STRUCT


struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(items: [])
    }
}

struct StatsLineChart: View {
    
    let data: LineChartData
    
    var body: some View {
        
        LineChart(chartData: data)
            .pointMarkers(chartData: data)
            .touchOverlay(chartData: data, specifier: "%.0f")
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
            .frame(minHeight: 150, idealHeight: 250, maxHeight: 400, alignment: .center)
            .padding(.horizontal, 10)
        
    }
}

struct StatsPieChart: View {
    
    let data: PieChartData
    
    var body: some View {
        
        PieChart(chartData: data)
            .headerBox(chartData: data)
            .legends(chartData: data, columns: [GridItem(.flexible()), GridItem(.flexible())])
            .id(data.id)
            .frame(minHeight: 150, idealHeight: 250, maxHeight: 400, alignment: .center)
            .padding(.horizontal, 10)
        
    }
    
}
