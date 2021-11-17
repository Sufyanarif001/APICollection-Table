//
//  Collection View.swift
//  APITableAndCollection
//
//  Created by Sufyan Arif on 16/11/2021.
//

import UIKit
import SkeletonView

class CollectionView: UIViewController {
    
    // MARK: -<#Properties#>
    var apiManager = APIManager()
    var heros =  [Heros]()
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    // MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        apiManager.getData(url: "https://api.opendota.com/api/heroStats", completion: { heroArr in
            self.heros = heroArr
            
        //    self.myCollectionView.reloadData()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            for _ in 0..<30{
            }
            
            self.myCollectionView.stopSkeletonAnimation()
            self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
            self.myCollectionView.reloadData()
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myCollectionView.isSkeletonable = true
        
        myCollectionView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .link),
                                                      animation: nil, transition: .crossDissolve(0.25))
       
    }
    

}

// MARK: -Extention for 
extension CollectionView: SkeletonCollectionViewDataSource{
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "customCell"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heros.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! collectionViewCell
        cell.collectionLabelName.text = heros[indexPath.row].localized_name
    
         let defaultLink = "https://api.opendota.com"
         let compelteLink = defaultLink + heros[indexPath.row].img

        cell.collectionImageVeiw.downloaded(from: compelteLink)
         return cell

        
    }
    
    
}
