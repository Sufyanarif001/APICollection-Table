//
//  customTableViewCell.swift
//  APITableAndCollection
//
//  Created by Sufyan Arif on 15/11/2021.
//

import UIKit

class customTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tableImageView: UIImageView!
    

    @IBOutlet weak var tbleLabelName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
