//
//  LoginViewController.swift
//  GradesReportGra
//
//  Created by Abhi on 1/31/18.
//  Copyright © 2018 GradesReport. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        loginButton.layer.cornerRadius = 20
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressSignInButton(_ sender: Any) {
        ///Redirect it to grades Report page
        let gradesReport = UIStoryboard(name: AppConstants.gradesReportStoryBoard.rawValue, bundle: nil).instantiateViewController(withIdentifier: AppConstants.gradesReport.rawValue)
        self.present(gradesReport, animated: true, completion: nil)
    }
    
}

extension LoginViewController {
    ///Load data from 
}

