//
//  ViewController.swift
//  go5
//
//  Created by Александр on 26.09.16.
//  Copyright © 2016 Александр. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var eMail: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var correctLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.delegate = self
        toolbar()
        placeholderColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func placeholderColor(){
        eMail.attributedPlaceholder = NSAttributedString(string: "EMAIL", attributes:[NSForegroundColorAttributeName : UIColor.black])
        password.attributedPlaceholder = NSAttributedString(string: "PASSWORD", attributes:[NSForegroundColorAttributeName : UIColor.black])
    }

    @IBAction func loginButton(_ sender: AnyObject) {
        if (eMail.text == "test@test.ru" && password.text == "password") {
            correctLabel.text = "Success"
            correctLabel.textColor = UIColor.green
        }
        else {
            correctLabel.text = "The email or password is incorrect."
            correctLabel.textColor = UIColor.red
        }
    }
    
    func toolbar(){
        let toolbar = UIToolbar.init()
        toolbar.sizeToFit()
        let barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: Selector("dismissKeyboard"))
        toolbar.items = [barButton]
        password.inputAccessoryView = toolbar
    }
    
    func dismissKeyboard(){
        password.resignFirstResponder()
    }
    
    func keyboard(password: UITextField) -> Bool{
        password.resignFirstResponder()
        return true
    }
    
    
}

