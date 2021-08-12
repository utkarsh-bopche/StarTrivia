//
//  ViewController.swift
//  StarTrivia
//
//  Created by Apple on 10/08/21.
//

import UIKit

class SelectPersonVC: UIViewController {

    //MARK:-IBoutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    //MARK:-Variables
    var personApi = PersonApi()
    
    //MARK:- Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        personApi.getRandomPersonUrlSession()
        
    }

//    deinit {
//        print(<#T##items: Any...##Any#>)
//    }
}

