//
//  ViewController.swift
//  Cards
//
//  Created by Macbook Air on 11.02.2022.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cards: [CardModel] = []
    private let random = Randomizer.shared
    private let currentDigits = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomCell")
        
    }
    
    @IBAction func addButtonIsPressed(_ sender: Any) {
        let id = random.randomImage()
        let randomNumber = random.randomNumber(digits: currentDigits)
        var number = ""
        randomNumber.enumerated().forEach { (index, character) in
            if index % 4 == 0 && index > 0 {
                number += " "
            }
            if index < 12 {
                number += "*"
            } else {
                number.append(character)
            }
        }
        
        if id == 0 {
            let card = CardModel(logo: "visa", cardNumber: number)
            cards.insert(card, at: 0)
        } else if id == 1 {
            let card = CardModel(logo: "mastercard", cardNumber: number)
            cards.insert(card, at: 0)
        }
        tableView.reloadData()
    }
}


extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else { return UITableViewCell () }
        if cards.count != 0 {
            let index = cards[indexPath.row]
            cell.logoImage.image = UIImage(named: index.logo)
            cell.cardNumberLabel.text = index.cardNumber
            return cell
        }
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let DetailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else { return }
        DetailsViewController.card = cards[indexPath.row]
        navigationController?.pushViewController(DetailsViewController, animated: true)
    }
}

