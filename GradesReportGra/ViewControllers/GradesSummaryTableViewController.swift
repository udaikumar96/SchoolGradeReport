//
//  GradesReportTableViewController.swift
//  GradesReportGra
//
//  Created by Abhi on 2/1/18.
//  Copyright © 2018 GradesReport. All rights reserved.
//

import UIKit

class GradesSummaryTableViewController: UITableViewController {
    //blue, orangish, green, red
    let colorsArray: [UIColor] = [UIColor(red: 137/255, green: 196/255, blue: 244/255, alpha: 1.0), UIColor(red: 244/255, green: 179/255, blue: 80/255, alpha: 1), UIColor(red: 102/255, green: 204/255, blue: 153/255, alpha: 1), UIColor(red: 226/255, green: 106/255, blue: 106/255, alpha: 1)]
    
    var customData: [[String: AnyObject]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var selectedObj : SubjectModel?
    var backgroundColor = UIColor.gray
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        ///register custom gradeReportCell
        let gradeReportCellNib = UINib(nibName: AppConstants.gradeSummaryTableViewCell.rawValue, bundle: nil)
        self.tableView.register(gradeReportCellNib, forCellReuseIdentifier: AppConstants.gradeSummaryReusableId.rawValue)
        
        ///Get all subjects data from local json
        customData = LocalServiceData.getAllSubjects()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        ///Set navigation title
        self.navigationItem.title = "Abhi Madduri" //Hard coded name
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return customData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.gradeSummaryReusableId.rawValue, for: indexPath)
        guard !customData.isEmpty,
            let customCell = cell as? GradeSummaryTableViewCell else { return cell }
        customCell.topView.backgroundColor = self.colorsArray[indexPath.row % colorsArray.count]
        let model = SubjectModel.init(withDict: customData[indexPath.row])
        customCell.subjectIndex.text = model.period
        customCell.subjectName.text = model.courseName
        customCell.percentage.text = model.percentage
        customCell.grade.text = model.grade
        customCell.testDate.text = model.lastDate
        customCell.bgColor = self.colorsArray[indexPath.row % colorsArray.count]
        return customCell
        
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedObj = SubjectModel.init(withDict: customData[indexPath.row])
        backgroundColor = self.colorsArray[indexPath.row % colorsArray.count]
        self.performSegue(withIdentifier: AppConstants.subjectDetailsSegue.rawValue, sender: self)
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SubjectDetailsViewController {
           destination.subjectObj = selectedObj
            destination.backgroundColor = backgroundColor
        }
        super.prepare(for: segue, sender: sender)
    }
 

}
