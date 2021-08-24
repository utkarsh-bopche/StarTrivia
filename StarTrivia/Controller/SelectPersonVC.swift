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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    //MARK:-Variables
    var personApi = PersonApi()
    var person : Person!
    
    //MARK:- Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:-IBActions
    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1 ... 87)
        spinner.startAnimating()
        personApi.getRandomPersonAlamo(id: random) { (person) in
            self.spinner.stopAnimating()
            if let person = person{
                // print(person.name)
                self.setupView(person: person)
                self.person = person
            }
        }
        
    }
    //MARK:- Private Methods
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person
        }
        //        switch segue.identifier {
        //        case Segue.home.rawValue:
        //            if let destination = segue.destination as? HomeworldVC {
        //                destination.person = person
        //            }
        //        case Segue.vehicles.rawValue:
        //            if let destination = segue.destination as? VehiclesVC {
        //                destination.person = person
        //            }
        //        case Segue.starships.rawValue:
        //            if let destination = segue.destination as? StarshipsVC{
        //                destination.person = person
        //            }
        //        case Segue.films.rawValue:
        //            if let destination = segue.destination as? FilmsVC {
        //                destination.person = person
        //            }
        //        default:
        //            break
        //        }
        //Use of switch case
        //        if segue.identifier == "toHomeworld" {
        //            if let destination = segue.destination as? HomeworldVC {
        //                destination.person = person
        //            }
        //        }else if segue.identifier == "toVehicles" {
        //            if let destination = segue.destination as? VehiclesVC {
        //                destination.person = person
        //            }
        //        }else if segue.identifier == "toStarships" {
        //            if let destination = segue.destination as? StarshipsVC {
        //                destination.person = person
        //            }
        //        }else if segue.identifier == "toFilms" {
        //            if let destination = segue.destination as? FilmsVC {
        //                destination.person = person
        //            }
        //        }
        //    }
        //Enum here use for above switch case
        //    enum Segue : String {
        //        case home = "toHomeWorld"
        //        case vehicles = "toVehicles"
        //        case starships = "toStarships"
        //        case films = "toFilms"
        //    }
    }
}

protocol PersonProtocol {
    var person: Person! {
        get set
    }
}

