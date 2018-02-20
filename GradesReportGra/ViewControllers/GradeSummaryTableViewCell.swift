//
//  GradeSummaryTableViewCell.swift
//  GradesReportGra
//
//  Created by Abhi on 1/31/18.
//  Copyright © 2018 GradesReport. All rights reserved.
//

import UIKit
import Charts

class GradeSummaryTableViewCell: UITableViewCell, ChartViewDelegate {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var subjectIndex: UILabel!
    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var testDate: UILabel!
    @IBOutlet weak var chartView: LineChartView!
    var bgColor: UIColor = UIColor.gray {
        didSet {
            setChartView()
        }
    }
    override func awakeFromNib() {
        topView.layer.cornerRadius = 10
        chartView.isUserInteractionEnabled = false
       // setChartView()
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setChartView() {
        var graphColor = bgColor
        
        var xAxis: [Double] = [1, 2, 3, 4, 5]
        var yAxis: [Double] = [Double(arc4random_uniform(100)),Double(arc4random_uniform(100)),Double(arc4random_uniform(100)),Double(arc4random_uniform(100)),Double(arc4random_uniform(100))]
        
        self.chartView.delegate = self
        
        self.chartView.chartDescription?.enabled = false
        self.chartView.setScaleEnabled(true)
        
        // x-axis limit line
        self.chartView.xAxis.labelPosition = .bottom
        self.chartView.xAxis.gridColor = bgColor
        self.chartView.xAxis.labelTextColor = bgColor

        let leftAxis = chartView.leftAxis
        leftAxis.removeAllLimitLines()
        leftAxis.gridColor = bgColor
        leftAxis.labelTextColor = bgColor
        leftAxis.axisLineColor = bgColor
        leftAxis.axisMaximum = 100
        leftAxis.axisMinimum = 0
        leftAxis.drawLimitLinesBehindDataEnabled = false
        chartView.rightAxis.enabled = false
        chartView.legend.form = .line
        
        
        
        func setDataCount(_ count: Int, range: UInt32) {
            let num = xAxis.count
            let values = (0..<num).map { return ChartDataEntry(x: xAxis[$0], y: yAxis[$0], icon: #imageLiteral(resourceName: "icon")) }
            
            let set1 = LineChartDataSet(values: values, label: "")
            set1.drawIconsEnabled = false
            
            set1.setColor(UIColor.white)
            set1.setCircleColor(.red)
            set1.lineWidth = 1
            set1.circleRadius = 2
            set1.drawCircleHoleEnabled = false
            set1.valueFont = .systemFont(ofSize: 0)
            set1.formLineWidth = 1
            set1.formSize = 15
            let data = LineChartData(dataSet: set1)
            
            chartView.data = data
        }
        
        setDataCount(Int(40), range: UInt32(100))
        
        chartView.animate(xAxisDuration: 0)
    }
    
    

    
}
