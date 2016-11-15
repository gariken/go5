

import UIKit
import Firebase
import CoreData


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
    
    func placeholderColor(){
        eMail.attributedPlaceholder = NSAttributedString(string: "EMAIL", attributes:[NSForegroundColorAttributeName : UIColor.black])
        password.attributedPlaceholder = NSAttributedString(string: "PASSWORD", attributes:[NSForegroundColorAttributeName : UIColor.black])
    }
    
    @IBAction func loginButton(_ sender: AnyObject) {
        zapros()
    }
    
    //MARK: CoreData Stack
    func zapros(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Registration")
        
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject]{
                //  print(result.value(forKey: "login")!)
                // print(result.value(forKey: "password")!)
                let login = result.value(forKey: "login") as! String
                let passwordOne = result.value(forKey: "password") as! String
                if ((eMail.text != login) || (password.text != passwordOne)){
                    correctLabel.text = "Данные введены не верно"
                } else{
                    correctLabel.text = "Милости прошу к нашему шалашу"
                    self.performSegue(withIdentifier: "go", sender: self)
                }
                
            }
            
        } catch{
            print(error)
        }
    }
    
    
    
    
    /**********/
    
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
    
    
}
