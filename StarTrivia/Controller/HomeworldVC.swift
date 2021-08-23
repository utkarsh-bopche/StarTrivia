//
//  HomeworldVC.swift
//  StarTrivia
//
//  Created by Apple on 20/08/21.
//

import UIKit

class HomeworldVC: UIViewController,PersonProtocol{

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    var person: Person!
    let api = HomeworldApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getHomeworld(url: person.homeworldUrl) { (homeworld) in
            if let homeworld = homeworld{
                self.setupUi(homeworld: homeworld)
            }
        }
    }
    
    func setupUi(homeworld: Homeworld) {
        nameLbl.text = homeworld.name
        climateLbl.text = homeworld.climate
        terrainLbl.text = homeworld.terrain
        populationLbl.text = homeworld.population
    }
  

}
