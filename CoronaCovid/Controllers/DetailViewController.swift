//
//  DetailViewController.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 28/04/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import UIKit
import UICircularProgressRing

class DetailViewController: UIViewController {
    
    var name: String!
    var countryflag: CovidPerCountry?
    var label: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()

    @IBOutlet weak var ivFlag: UIImageView!
    @IBOutlet weak var lbDeaths: UILabel!
    @IBOutlet weak var lbTodayCases: UILabel!
    @IBOutlet weak var lbTotalCases: UILabel!
    @IBOutlet weak var viewInfos: UIView!
    @IBOutlet weak var viewLoad: UIView!
    @IBOutlet weak var aiLoad: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        let circularRing = UICircularProgressRing()
//        viewInfos.addSubview(circularRing)
        
        label.text = "Carregando..."
        loadInfos()
        setupViewInfos()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    
    func loadInfos() {
        RequestPerCountry.loadDetailPerCountry(name: name, onComplete: { (country) in
            if let country = country {
                self.countryflag = country
                DispatchQueue.main.async {
                    self.lbDeaths.text = "Total de Mortes: \(country.deaths ?? 0)"
                    self.lbTodayCases.text = "Casos descobertos hoje: \(country.todayCases ?? 0)"
                    self.lbTotalCases.text = "Total de casos neste País: \(country.cases ?? 0)"
                    
                    self.loadImage(with: self.countryflag!)
                    
                    self.aiLoad.stopAnimating()
                    self.viewLoad.isHidden = true
                }
            }
            
        }) { (Err) in
            print(Err)
        }
    }
    
    func loadImage(with flag: CovidPerCountry) {
        guard let url = flag.countryInfo?.flag else { return }
        guard let flagURL = URL(string: url) else { return }
            guard let data = try? Data(contentsOf: flagURL) else { return }
            self.ivFlag.image = UIImage(data: data)
        
    }
    
    func setupViewInfos() {
        viewInfos.layer.cornerRadius = 25
    }
}
