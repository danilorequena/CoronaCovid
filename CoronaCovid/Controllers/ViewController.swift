//
//  ViewController.swift
//  CoronaCovid
//
//  Created by Danilo Requena on 28/04/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewLogo: UIView!
    @IBOutlet weak var tfCountry: UITextField!
    @IBOutlet weak var btConsult: UIButton!
    
    var countries: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLogo()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        tfCountry.resignFirstResponder()
        let vc = segue.destination as! DetailViewController
        vc.name =  tfCountry.text
    }

    @IBAction func Consult(_ sender: Any) {
//        var countryValue = tfCountry.text?.lowercased()
//        country = countryValue
//        print(country)
    }
    
    func setupLogo() {
        self.viewLogo.dropShadow()
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -150 // Move view 150 points upward
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
    
}

extension UIView {

      func dropShadow() {

          var shadowLayer: CAShapeLayer!
          let cornerRadius: CGFloat = 16.0
          let fillColor: UIColor = #colorLiteral(red: 0.9703693986, green: 0.9633544087, blue: 0.9757398963, alpha: 1)

          if shadowLayer == nil {
              shadowLayer = CAShapeLayer()

              shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
              shadowLayer.fillColor = fillColor.cgColor

              shadowLayer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
              shadowLayer.shadowPath = shadowLayer.path
              shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
              shadowLayer.shadowOpacity = 0.5
              shadowLayer.shadowRadius = 5

              layer.insertSublayer(shadowLayer, at: 0)
          }
      }
}

