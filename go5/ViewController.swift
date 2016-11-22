

import UIKit
import Firebase


@available(iOS 10.0, *)
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

    @IBAction func registarationButton(_ sender: Any) {
        self.performSegue(withIdentifier: "Registration", sender: self)
    }
    
       @IBAction func loginButton(_ sender: AnyObject) {
        autorization(login: eMail.text!, password: password.text!)
    }
    
    //MARK: Firebase Stack
    
    func autorization(login: String, password: String){
        FIRAuth.auth()?.signIn(withEmail: login, password: password, completion: { user, error in
            if (error != nil){
            self.alerView(title: "Ошибка", message: "Введены некоректные данные")
            }
            else{
                self.performSegue(withIdentifier: "login", sender: self)
            }
        })
    }
    
    /**********/
    //MARK: UI
    func toolbar(){
        let toolbar = UIToolbar.init()
        toolbar.sizeToFit()
        let barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(ViewController.dismissKeyboard))
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
    
    func placeholderColor(){
        eMail.attributedPlaceholder = NSAttributedString(string: "EMAIL", attributes:[NSForegroundColorAttributeName : UIColor.black])
        password.attributedPlaceholder = NSAttributedString(string: "PASSWORD", attributes:[NSForegroundColorAttributeName : UIColor.black])
    }
    /*****************/
    
    //MARK: ALertView
    
    func alerView(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (ok) in
            print("ошибка")
        }
        
        alertController.addAction(ok)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
