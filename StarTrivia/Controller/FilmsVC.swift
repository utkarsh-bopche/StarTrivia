//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by Apple on 20/08/21.
//

import UIKit

class FilmsVC: UIViewController,PersonProtocol {
    
    //MARK:- IBOutlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var crawlLbl: UITextView!
    
    //MARK:- Variables & Constants
    var person:Person!
    let api = FilmsApi()
    var films = [String]()
    var currentFilm = 0
    
    //MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        films = person.filmUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = films.count > 1
        guard let firstFilm = films.first else { return}
        getFilm(url: firstFilm)
        
    }
    
    //MARK:- Private Methods
    func getFilm (url :String) {
        api.getFilm(url: url) { (film) in
            if let film = film {
                self.setupView(film: film)
            }
        }
    }
    
    func setupView(film:Film) {
        titleLbl.text = film.title
        episodeLbl.text = String(film.episode)
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releasedLbl.text = film.releaseDate
        let stripped = film.crawl.replacingOccurrences(of: "\n", with: " ")
        crawlLbl.text = stripped.replacingOccurrences(of: "\r", with: "")
    }
    
    //MARK:- IBActions
    @IBAction func previousClicked(_ sender: Any) {
        currentFilm -= 1
        setButtonState()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentFilm += 1
        setButtonState()
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentFilm == films.count - 1 ? false:true
        previousBtn.isEnabled = currentFilm == 0 ? false:true
        getFilm(url: films[currentFilm])
    }
    
    
}
