//
//  registrationViewController.swift
//  
//
//  Created by Александр on 31.10.16.
//
//

import UIKit
import Firebase

@available(iOS 10.0, *)
class registrationViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var emailRegistration: UITextField!
    @IBOutlet weak var passwordRegistration: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordRegistration.delegate = self
        toolbar()
    }

    @IBAction func registrationButton(_ sender: Any) {
        saveData(login: emailRegistration.text!, password: passwordRegistration.text!)
    }


    //MARK: Firebase Registration
    
    func saveData(login:String, password:String){
        FIRAuth.auth()?.createUser(withEmail: login, password: password, completion: { user, error in
            if (error != nil){
                self.alerView(title: "Ошибка", message: "Введенная Вами почта уже зарегистрированна, или некорректно введена")
            }
            else{
                self.alerViewTwo(title: "Вы успешно зарегистрировались!", message: "Чтобы зайти в приложение используйте своюэлектронную почту и пароль")
            }
        })
    }
    
    //MARK: Keyboard Dissmiss
    func toolbar(){
        let toolbar = UIToolbar.init()
        toolbar.sizeToFit()
        let barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(ViewController.dismissKeyboard))
        toolbar.items = [barButton]
        passwordRegistration.inputAccessoryView = toolbar
    }
    
    func dismissKeyboard(){
        passwordRegistration.resignFirstResponder()
    }
    
    func keyboard(password: UITextField) -> Bool{
        password.resignFirstResponder()
        return true
    }

    //MARK: AlertView
    
    func alerView(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
            print("ошибка")
        }
        
        alertController.addAction(ok)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alerViewTwo(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Выполнить вход", style: .default) { (ok) in
            print("Все успешно")
            self.performSegue(withIdentifier: "back", sender: self)
        }
        
        alertController.addAction(ok)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
