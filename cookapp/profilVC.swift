//
//  profilVC.swift
//  cookapp
//
//  Created by Olgun ‏‏‎‏‏‎ on 23.12.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class profilVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signoutClicked(_ sender: Any) {
        
            do {
                try Auth.auth().signOut()
                self.performSegue(withIdentifier: "toanaekran", sender: nil)
        
                
                
            }
            catch {
                
                
            
        }
        
    }
    

    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    

}
