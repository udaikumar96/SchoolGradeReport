//
//  GradeSummaryTableViewCell.swift
//  GradesReportGra
//
//  Created by Abhi on 1/31/18.
//  Copyright © 2018 GradesReport. All rights reserved.
//

import UIKit

class GradeSummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var subjectIndex: UILabel!
    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var testDate: UILabel!
    
    override func awakeFromNib() {
        topView.layer.cornerRadius = 10
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
