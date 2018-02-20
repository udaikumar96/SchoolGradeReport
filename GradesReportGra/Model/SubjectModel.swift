//
//  SubjectModel.swift
//  GradesReportGra
//
//  Created by Abhi on 2/14/18.
//  Copyright © 2018 GradesReport. All rights reserved.
//

import Foundation

class SubjectModel {
    private let responseDict : [String: AnyObject]
    
    var period : String {
        return String(describing: responseDict["Period"] as? Int ?? 0)
    }
    
    var courseId: String {
        return String(describing: responseDict["CourseId"] as? Int ?? 0)
    }
    
    var courseName: String {
        return responseDict["CourseName"]  as? String ?? ""
    }

    init (withDict dict: [String: AnyObject] ) {
        responseDict = dict
    }
}
