//
//  DetailsViewController.swift
//  Cards
//
//  Created by Macbook Air on 12.02.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var cardLogo: UIImageView!
    
    var card: CardModel?
    private let visaColor = UIColor(rgb: 0xfaaa13)
    private let mastercardColor = UIColor(rgb: 0x222222)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWith(card: card)
    }
    
    private func configureWith(card: CardModel?) {
        cardView.layer.cornerRadius = 20

        cardNumberLabel.text = card?.cardNumber

        guard let logoPath = card?.logo else { return }
        cardLogo.image = UIImage(named: logoPath)
        if logoPath == "visa" {
            cardView.backgroundColor = visaColor
        } else {
            cardView.backgroundColor = mastercardColor
        }
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
