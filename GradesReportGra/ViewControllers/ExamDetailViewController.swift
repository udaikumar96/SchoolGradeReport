//
//  ExamDetailViewController.swift
//  GradesReportGra
//
//  Created by Abhi on 2/4/18.
//  Copyright © 2018 GradesReport. All rights reserved.
//

import UIKit

class ExamDetailViewController: UIViewController {

    @IBOutlet weak var subjectname: UILabel!
    @IBOutlet weak var examName: UILabel!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var topView: UIView!
    
    var backgroundColor = UIColor.white
    var VCTitle = ""
    var subjectDetailsObj : SubjectDetailsModel?
    
    override func viewDidLoad() {
        setUI()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setUI() {
        
        guard let customObj = subjectDetailsObj else { return }
            topView.backgroundColor = backgroundColor
            topView.layer.cornerRadius = 20
            subjectname.text = VCTitle
            examName.text = customObj.examName
            percentage.text = customObj.percentage
            score.text = customObj.score
        
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? LineChartViewController {
            destination.graphColor = backgroundColor
        }
        super.prepare(for: segue, sender: sender)
    }

}

