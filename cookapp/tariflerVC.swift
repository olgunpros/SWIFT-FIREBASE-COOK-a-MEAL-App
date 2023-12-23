//
//  tariflerVC.swift
//  cookapp
//
//  Created by Olgun ‏‏‎‏‏‎ on 23.12.2023.
//

import UIKit
import Firebase
import SDWebImage
class tariflerVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var userCommentArray = [String]()
    var userCommenttArray = [String]()
    var userImageArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getDataFromFirestore()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userCommentArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.adLabel.text = userCommentArray[indexPath.row]
        cell.tarifLabel.text = userCommenttArray[indexPath.row]
        cell.userImageView.sd_setImage(with: URL(string: self.userImageArray[indexPath.row]))
     
        return cell
    }
    func getDataFromFirestore() {
        let fireStoreDatabase = Firestore.firestore()
        fireStoreDatabase.collection("Posts").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription)
            }
            else {
                if snapshot?.isEmpty != true && snapshot != nil{
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        if let postComment =  document.get("postComment") as? String {
                            self.userCommentArray.append(postComment)
                            
                        }
                        if let postcommentt = document.get("postcommentt") as? String {
                            self.userCommenttArray.append(postcommentt)
                        }
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.userImageArray.append(imageUrl)
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
        
        
    }
    

    
    

}
