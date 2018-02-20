//
//  GradesReportConstants.swift
//  GradesReportGra
//
//  Created by Abhi on 2/1/18.
//  Copyright © 2018 GradesReport. All rights reserved.
//

import Foundation
import UIKit

enum AppConstants: String {
    case gradesReportStoryBoard = "GradesReports"
    case gradesReport = "gradesReport"
    case gradeSummaryReusableId = "gradeSummary"
    case gradeSummaryTableViewCell = "GradeSummaryTableViewCell"
    case examDetailTableCell = "SubjectDetailsTableViewCell"
    case tableViewReuseId = "tableViewReuseId"
    case subjectExamsId = "subjectDetailsReusableId"
    case subjectDetailsSegue = "subjectDetailsSegue"
    case examDetailSegue = "examDetailSegue"
    case examsDetailLineChart = "examsDetailLineChart"
}


class LocalServiceData {
    
    static func getAllSubjects() -> [[String:AnyObject]] {
        return getData(forResource: "Subjects")
    }
    
    static func getSubjectDetailsData(forSubjectId id: String ) -> [[String:AnyObject]] {
        let resource = id + "SubjectDetails"
        return getData(forResource: resource)
    }
    
    private static func getData(forResource resource: String) -> [[String:AnyObject]] {
        if let configPath = Bundle.main.path(forResource: resource, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: configPath), options: Data.ReadingOptions.mappedIfSafe)
                let parsedJson = try JSONSerialization.jsonObject(with: data, options:.allowFragments) as? [[String:AnyObject]]
                if let parsedJSON = parsedJson {
                    return parsedJSON
                } else {
                    print("Error while parsing data")
                }
            } catch let dataError as NSError {
                print("Error while getting data from main bundle: \(dataError.localizedDescription)")
            }
        }
        else {
            print("File doesn't exist")
        }
        return []
    }
}
