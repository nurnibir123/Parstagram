//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Nur Nibir on 3/17/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!;
        let password = passwordField.text!;
        PFUser.logInWithUsername(inBackground: username, password: password) {
          (user: PFUser?, error: Error?) -> Void in
          if user != nil {
            self.performSegue(withIdentifier: "loginSegue", sender: nil);
          } else {
            print("Error: \(String(describing: error?.localizedDescription))");
          }
        }
        
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text!;
        user.password = passwordField.text!;
        
        user.signUpInBackground {
            (success: Bool, error: Error?) -> Void in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil);
            } else {
                print("Error: \(String(describing: error?.localizedDescription))");
            }
          }
    }
    
}
