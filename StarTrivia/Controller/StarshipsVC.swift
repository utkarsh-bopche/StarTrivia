//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Apple on 20/08/21.
//

import UIKit

class StarshipsVC: UIViewController,PersonProtocol {
    
    //MARK:- IBoutlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    @IBOutlet weak var previousBtn: FadeEnabledBtn!
    
    //MARK:- Variables & Consonants
    var person: Person!
    let api = StarshipApi()
    var starships = [String]()
    var currentStarship = 0
    
    //MARK:- Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        starships = person.starshipUrls
        nextBtn.isEnabled = starships.count > 1
        previousBtn.isEnabled = false
        guard let firstStarship = starships.first else { return }
        getVehicle(url: firstStarship)
    }
    
    //MARK:- Private Methods
    func getVehicle(url: String) {
        api.getStarship(url: url) { (starship) in
            if let starship = starship {
                self.setupView( starship: starship)
            }
        }
        
        
    }
    
    func setupView(starship: Starship) {
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        makerLbl.text = starship.manufacturer
        costLbl.text = starship.cost
        lengthLbl.text = starship.length
        speedLbl.text = starship.speed
        crewLbl.text = starship.crew
        passengersLbl.text = starship.passengers
    }
    
    //MARK:- IBActions
    @IBAction func nextClicked(_ sender: Any) {
        currentStarship += 1
        setButtonState()
        
    }
    
    @IBAction func previousClicked(_ sender: Any) {
        currentStarship -= 1
        setButtonState()
        
    }
    func setButtonState() {
        nextBtn.isEnabled = currentStarship == starships.count-1 ? false : true
        previousBtn.isEnabled = currentStarship == 0 ? false : true
        
        getVehicle(url: starships[currentStarship])
    }
    
}
