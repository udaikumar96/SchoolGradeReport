//
//  SubjectDetailsTableViewCell.swift
//  GradesReportGra
//
//  Created by Abhi on 2/4/18.
//  Copyright © 2018 GradesReport. All rights reserved.
//

import UIKit

class SubjectDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var examName: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var percentage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        topView.layer.cornerRadius = 30
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
