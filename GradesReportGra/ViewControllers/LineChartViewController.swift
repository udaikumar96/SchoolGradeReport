//
//  LineGraphView.swift
//  GradesReportGra
//
//  Created by Abhi on 2/5/18.
//  Copyright © 2018 GradesReport. All rights reserved.
//

import UIKit
import Charts

class LineChartViewController: DemoBaseViewController {

    @IBOutlet var chartView: LineChartView!
    
    var graphColor = UIColor.black

    var xAxis: [Double] = [1, 2, 3, 4, 5, 6]
    var yAxis: [Double] = [90,20,40,60,50,70]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "Line Chart 1"
        self.options = [.toggleValues,
                        .toggleFilled,
                        .toggleCircles,
                        .toggleCubic,
                        .toggleHorizontalCubic,
                        .toggleIcons,
                        .toggleStepped,
                        .toggleHighlight,
                        .animateX,
                        .animateY,
                        .animateXY,
                        .saveToGallery,
                        .togglePinchZoom,
                        .toggleAutoScaleMinMax,
                        .toggleData]

        chartView.delegate = self

        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true

        // x-axis limit line
        let llXAxis = ChartLimitLine(limit: 10, label: "")
        llXAxis.lineWidth = 4

        llXAxis.lineDashLengths = [10, 10, 0]
        llXAxis.labelPosition = .leftBottom
        llXAxis.valueFont = .systemFont(ofSize: 10)
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.gridColor = UIColor.white
        chartView.xAxis.gridLineDashLengths = [10, 10]
        chartView.xAxis.gridLineDashPhase = 0

//        let ll1 = ChartLimitLine(limit: 150, label: "Upper Limit")
//        ll1.lineWidth = 4
//        ll1.lineDashLengths = [5, 5]
//        ll1.labelPosition = .rightTop
//        ll1.valueFont = .systemFont(ofSize: 10)
//
        let leftAxis = chartView.leftAxis
        leftAxis.removeAllLimitLines()
        leftAxis.labelTextColor = UIColor.white
        leftAxis.axisLineColor = UIColor.white
        leftAxis.axisMaximum = 120
        leftAxis.axisMinimum = 0
        leftAxis.gridLineDashLengths = [5, 5]
        leftAxis.drawLimitLinesBehindDataEnabled = false
        chartView.rightAxis.enabled = false

        let marker = BalloonMarker(color: UIColor(white: 180/255, alpha: 1),
                                   font: .systemFont(ofSize: 12),
                                   textColor: .white,
                                   insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8))
        marker.chartView = chartView
        marker.minimumSize = CGSize(width: 80, height: 10)
        chartView.marker = marker

        chartView.legend.form = .line

         self.updateChartData()

        chartView.animate(xAxisDuration: 2.5)
    }

    override func updateChartData() {
        if self.shouldHideData {
            chartView.data = nil
            return
        }

        self.setDataCount(Int(40), range: UInt32(100))
    }

    func setDataCount(_ count: Int, range: UInt32) {
        let num = xAxis.count
        let values = (0..<num).map { return ChartDataEntry(x: xAxis[$0], y: yAxis[$0], icon: #imageLiteral(resourceName: "icon")) }

        let set1 = LineChartDataSet(values: values, label: "")
        set1.drawIconsEnabled = false
        
        set1.setColor(graphColor)
        set1.setCircleColor(.red)
        set1.lineWidth = 2
        set1.circleRadius = 4
        set1.drawCircleHoleEnabled = false
        set1.valueFont = .systemFont(ofSize: 0)
        set1.formLineWidth = 1
        set1.formSize = 15

        let gradientColors = [graphColor.withAlphaComponent(0.1).cgColor,graphColor.withAlphaComponent(0.4).cgColor]

        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!

        set1.fillAlpha = 1
        set1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
        set1.drawFilledEnabled = true

        let data = LineChartData(dataSet: set1)

        chartView.data = data
    }

}


