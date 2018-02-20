//
//  GradesDetailsViewController.swift
//  GradesReportGra
//
//  Created by Abhi on 2/4/18.
//  Copyright © 2018 GradesReport. All rights reserved.
//

import UIKit

class SubjectDetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var graph: UIView!
    var customData: [[String: AnyObject]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var backgroundColor = UIColor.white
    
    var selectedObj : SubjectDetailsModel?
    var subjectObj: SubjectModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let examDetailCellNib = UINib(nibName: AppConstants.examDetailTableCell.rawValue, bundle: nil)
        self.tableView.register(examDetailCellNib, forCellReuseIdentifier: AppConstants.subjectExamsId.rawValue)
        self.navigationController?.navigationBar.topItem?.title = ""
        //get subject exam details from local SubjectDetails.json file
        if let subjectObj = subjectObj {
            customData = LocalServiceData.getSubjectDetailsData(forSubjectId: subjectObj.courseId)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        //set navigation bar title to subject name
        self.navigationItem.title = subjectObj?.courseName ?? ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ExamDetailViewController {
            destination.subjectDetailsObj = selectedObj
            destination.backgroundColor = backgroundColor
            destination.VCTitle = subjectObj?.courseName ?? ""
        } else if let destination = segue.destination as? LineChartViewController {
            destination.graphColor = backgroundColor
        }
        super.prepare(for: segue, sender: sender)
    }
 

}

extension SubjectDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return customData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.subjectExamsId.rawValue, for: indexPath)
        guard !customData.isEmpty,
              let customCell = cell as? SubjectDetailsTableViewCell else { return cell }
        let subjectDetailObj = SubjectDetailsModel.init(withDict: customData[indexPath.row])
        customCell.topView.backgroundColor = backgroundColor
        customCell.examName.text = subjectDetailObj.examName
        customCell.category.text = subjectDetailObj.category
        customCell.percentage.text = subjectDetailObj.percentage
        customCell.score.text = subjectDetailObj.score
        return customCell
    }
    
    
    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedObj = SubjectDetailsModel.init(withDict: customData[indexPath.row])
       self.performSegue(withIdentifier: AppConstants.examDetailSegue.rawValue, sender: self)
    }
}
