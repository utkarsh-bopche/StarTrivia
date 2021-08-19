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
    }

//MARK:-IBActions
    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1 ... 87)
        personApi.getRandomPersonAlamo(id: random) { (person) in
            if let person = person{
               // print(person.name)
                self.nameLabel.text = person.name
                self.heightLabel.text = person.height
                self.massLabel.text = person.mass
                self.hairLabel.text = person.hair
                self.birthYearLabel.text = person.birthYear
                self.genderLabel.text = person.gender
            }
        }    }
    
//    deinit {
//        print(<#T##items: Any...##Any#>)
//    }
}

