//
//  SubjectDetailsModel.swift
//  GradesReportGra
//
//  Created by Abhi on 2/7/18.
//  Copyright © 2018 GradesReport. All rights reserved.
//

import Foundation

class SubjectDetailsModel {
    
    private let responseDict : [String: AnyObject]
    
    var examName : String {
       return responseDict["Description"] as? String ?? ""
    }
    
    var category: String {
        return responseDict["Category"]  as? String ?? ""
    }
    
    var percentage: String {
        return responseDict["percentage"]  as? String ?? ""
    }
    
    var score: String {
        return "\(String(describing: responseDict["ScoreGained"] as? Int ?? 0)) / \(String(describing: responseDict["ScoreMax"] as? Int ?? 0)) "
    }
    
    init (withDict dict: [String: AnyObject] ) {
        responseDict = dict
    }
}
