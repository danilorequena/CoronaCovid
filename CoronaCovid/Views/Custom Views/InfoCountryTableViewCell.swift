//
//  InfoCountryTableViewCell.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 7/12/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import UIKit

class InfoCountryTableViewCell: UITableViewCell {
    
    class func loadNib() -> UINib{
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    class func identifier() -> String {
        return String(describing: self)
    }

    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var lbInfecteds: UILabel!
    @IBOutlet weak var lbDeaths: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(country: CovidPerCountry) {
        lbInfecteds.text = country.cases?.formatarMilhar
        lbDeaths.text = country.deaths?.formatarMilhar
    }

}
