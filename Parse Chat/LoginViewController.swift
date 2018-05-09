//
//  LoginViewController.swift
//  Parse Chat
//
//  Created by Elijah Kumi on 4/29/18.
//  Copyright © 2018 Elijah Kumi. All rights reserved.
//

import UIKit
import Parse 

class LoginViewController: UIViewController {
    
    @IBOutlet weak var UsernameText: UITextField!
    
    @IBOutlet weak var PassswordText: UITextField!
    
    @IBAction func SignUp(_ sender: Any) {
        
        let newUser = PFUser()
        newUser.username = UsernameText.text
        newUser.password = PassswordText.text
        
        if (UsernameText.text?.isEmpty)! || (PassswordText.text?.isEmpty)! {
            AlertControllers(title: "Warning", message: "username or password cannot be empty")
        }
        
        
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("Success!")
            } else {
                print(error?.localizedDescription)
            }
        }
        
    }
    
    
    
    @IBAction func Login(_ sender: Any) {
        if (UsernameText.text?.isEmpty)! || (PassswordText.text?.isEmpty)! {
            AlertControllers(title: "Warning!", message: "username or password cannot be empty")
        }
        
        
        PFUser.logInWithUsername(inBackground: UsernameText.text! , password: .text!) { (user: PFUser? , error: Error?) in
            
            if user != nil {
                print("You're logged in")
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }
        }
    }
    
    
    func AlertControllers(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
            alert.dismiss(animated: true, completion: nil)
        }
        // add the OK action to the alert controller
        alert.addAction(OKAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
