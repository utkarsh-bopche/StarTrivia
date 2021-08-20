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
    
    @IBOutlet weak var homeWorldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
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
                self.setupView(person: person)
            }
        }
        
    }
    
    func setupView(person:Person){
        self.nameLabel.text = person.name
        self.heightLabel.text = person.height
        self.massLabel.text = person.mass
        self.hairLabel.text = person.hair
        self.birthYearLabel.text = person.birthYear
        self.genderLabel.text = person.gender
        
        homeWorldBtn.isEnabled = !person.homeworldUrl.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        starshipsBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.vehicleUrls.isEmpty
            
    
        
    }
    
    @IBAction func homeWorldClicked(_ sender: Any) {
    }
    
    @IBAction func vehiclesClicked(_ sender: Any) {
    }
    
    @IBAction func starshipsClicked(_ sender: Any) {
    }
    
    @IBAction func filmsClicked(_ sender: Any) {
    }
    //    deinit {
//        print(<#T##items: Any...##Any#>)
//    }
}

