//
//  ViewController.swift
//  APITableAndCollection
//
//  Created by Sufyan Arif on 15/11/2021.
//

import UIKit
var isSelected :Bool = true
class ViewController: UIViewController {
    @IBOutlet weak var flipBUtton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UIView!
    @IBOutlet weak var collectionVeiw: UIView!
    
    
    
    @IBAction func flipButtonChangeTapped(_ sender: UIButton) {
        isSelected = !isSelected
                    if isSelected {
                        tableView.isHidden = true
                        collectionVeiw.isHidden = false
                        flipBUtton.setImage(UIImage(named: "list.png"), for: .normal)
                        titleLabel.text = "Collection View"
                    } else {
                        collectionVeiw.isHidden = true
                        tableView.isHidden = false
                        flipBUtton.setImage(UIImage(named: "menu.png"), for: .normal)
                        titleLabel.text = "Table View"
    
                        
        
                    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
}

