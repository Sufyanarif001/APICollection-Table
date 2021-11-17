//
//  TabelVeiw.swift
//  APITableAndCollection
//
//  Created by Sufyan Arif on 15/11/2021.
//

import UIKit
import SkeletonView


class TabelVeiw: UIViewController{
    
    @IBOutlet weak var myTableView: UITableView!
    
    var apiManager = APIManager()
    var heros =  [Heros]()
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        apiManager.getData(url: "https://api.opendota.com/api/heroStats", completion: { heroArr in
            self.heros = heroArr
            
            //self.myTableView.reloadData()
        })
        
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
            
            
            
            for _ in 0..<30{
                
            }
            
            self.myTableView.stopSkeletonAnimation()
            self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
            
            self.myTableView.reloadData()
           
        })
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myTableView.isSkeletonable = true
       myTableView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .link),
                                                  animation: nil,
                                                transition: .crossDissolve(0.25))
    


}
    }


extension TabelVeiw:SkeletonTableViewDataSource{
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "customCell"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(heros.count)
        return heros.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! customTableViewCell
       cell.tbleLabelName.text = heros[indexPath.row].localized_name

        let defaultLink = "https://api.opendota.com"
        let compelteLink = defaultLink + heros[indexPath.row].img

        cell.tableImageView.downloaded(from: compelteLink)
        return cell

    }

}

