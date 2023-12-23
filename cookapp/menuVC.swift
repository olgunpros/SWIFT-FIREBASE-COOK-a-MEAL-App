//
//  menuVC.swift
//  cookapp
//
//  Created by Olgun ‏‏‎‏‏‎ on 23.12.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class menuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tariflerClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "totarifler", sender: nil)
    }
    
    @IBAction func menulerClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "tomenuler", sender: nil)
    }
    
    @IBAction func blogClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toblog", sender: nil)
    }
    
    @IBAction func videolarClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "tovideolar", sender: nil)
    }
    
    @IBAction func tarifekleClicked(_ sender: Any) {
        if Auth.auth().currentUser == nil {
            self.performSegue(withIdentifier: "togirisyap", sender: nil)
        }
        else {
            self.performSegue(withIdentifier: "totarifekle", sender: nil)

        }
    }
    @IBAction func signinClicked(_ sender: Any) {
        if Auth.auth().currentUser == nil {
            self.performSegue(withIdentifier: "togirisyap", sender: nil)
        }
        else {
            self.makeAlert(title: "Error", message: "Already logged in")
            
        }
        
    }
    @IBAction func profileClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "tocikisyap", sender: nil)
    }
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}
