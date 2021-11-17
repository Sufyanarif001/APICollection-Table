//
//  API Manager.swift
//  APITableAndCollection
//
//  Created by Sufyan Arif on 15/11/2021.
//

import Foundation

class APIManager{
    func getData(url:String, completion: @escaping ([Heros]) -> () ){
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, responce, error in
            if error == nil{
                
            do{
                let heroArr = try JSONDecoder().decode([Heros].self, from: data!)
                DispatchQueue.main.async {
                    completion(heroArr)
                }
            } catch{
                print("Pars Error")
            }
            }else{
                print("No data returned from call" + "\(String(describing: error))")
            }

        }.resume()
    }
    
    
    
   
    
}



































//class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//
//    var heros = [Heros]()
//
//    // MARK: -IBOutlet
//    @IBOutlet weak var myCollectionView: UICollectionView!
//
//
//
//
//
//    // MARK: -Life Cycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        let url = URL(string: "https://api.opendota.com/api/heroStats" )
//        URLSession.shared.dataTask(with: url!) { data, responce, error in
//
//            do{
//                self.heros = try JSONDecoder().decode([Heros].self, from: data!)
//            } catch{
//                print("Pars Error")
//            }
//
//            DispatchQueue.main.async {
//                print(self.heros.count)
//                self.myCollectionView.reloadData()
//            }
//
//        }.resume()
//    }
//
//
//
//
//    // MARK: -Private Function of Collection  View
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return heros.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCell
//        cell.nameLabel.text = heros[indexPath.row].localized_name.capitalized
//
//        let defaultLink = "https://api.opendota.com"
//        let compelteLink = defaultLink + heros[indexPath.row].img
//
//
//        cell.layer.cornerRadius = 10
//        cell.layer.borderWidth = 1
//
//        cell.imageView.clipsToBounds = true
//        cell.imageView.contentMode = .scaleAspectFit
//
//
//        cell.imageView.downloaded(from: compelteLink)
//        return cell
//    }
//
//
//
//
//// MARK: -private function of Layout
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: (view.frame.width/2) - 20,
//                      height: (view.frame.width/3) - 3)
//    }
//    // for item Spacing
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//    // for line spacing
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//
//}
//
//
//
//// MARK: -Extentino for img downloader
//

//
