//
//  collectionViewCell.swift
//  APITableAndCollection
//
//  Created by Sufyan Arif on 16/11/2021.
//

import UIKit

class collectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionImageVeiw: UIImageView!{
        didSet{
            collectionImageVeiw.layer.cornerRadius = 10
            collectionImageVeiw.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var collectionLabelName: UILabel!
    
}
