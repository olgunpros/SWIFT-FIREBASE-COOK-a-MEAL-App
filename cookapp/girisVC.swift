import UIKit
import Firebase

class girisVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signinClicked(_ sender: Any) {
        if emailText.text != nil && passwordText.text != nil {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) {(authData,error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }
                else {
                    self.performSegue(withIdentifier: "togirisbasarili", sender: nil)
                    
                }
                
            }
        }
        else {
            self.makeAlert(title: "Error", message: "Email? / Password?")
        }
    }
    

    @IBAction func signupClicked(_ sender: Any) {
        if emailText.text != nil && passwordText.text != nil {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authData, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "togirisbasarili", sender: nil)
                }
            }
        }
        else {
            self.makeAlert(title: "Error", message: "Email ? / Password?")
        }
    }

    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
