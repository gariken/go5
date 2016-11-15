//
//  registrationViewController.swift
//  
//
//  Created by Александр on 31.10.16.
//
//

import UIKit
import Firebase
import CoreData

@available(iOS 10.0, *)
class registrationViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var emailRegistration: UITextField!
    @IBOutlet weak var passwordRegistration: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repeatPassword.delegate = self
        passwordRegistration.delegate = self
        toolbar()
       
    }

    @IBAction func registrationButton(_ sender: Any) {
        saveData(login: emailRegistration.text!, password: passwordRegistration.text!)
    }


    //MARK: CoreData Stack
    
    func saveData(login:String, password:String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newUSer = NSEntityDescription.insertNewObject(forEntityName: "Registration", into: context)
        
        newUSer.setValue(login, forKey: "login")
        newUSer.setValue(password, forKey: "password")
        
        if ((emailRegistration.text?.isEmpty)! || (passwordRegistration.text?.isEmpty)! || (repeatPassword.text?.isEmpty)! ){
            errorLabel.text = "пусто, пусто"
        }
            
        else if(passwordRegistration.text != repeatPassword.text){
            errorLabel.text = "Пароли не совпадают"
        }
            
        else{
            errorLabel.text = "не пусто"
            do{
                try context.save()
                print("saved")
                errorLabel.text = "Данные успешно сохранены"
                self.performSegue(withIdentifier: "vhod", sender: self)
            }
            catch{
                print("Ошибка - \(error)")
            }
        }
    }
    
    //MARK: CoreDataPrint
    func printData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Registration")
        
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject]{
                print(result.value(forKey: "login")!)
                print(result.value(forKey: "password")!)
            }
            
        } catch{
            print(error)
        }
    }
    
    /***********/
    
    
    func toolbar(){
        let toolbar = UIToolbar.init()
        toolbar.sizeToFit()
        let barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(ViewController.dismissKeyboard))
        toolbar.items = [barButton]
        repeatPassword.inputAccessoryView = toolbar
        passwordRegistration.inputAccessoryView = toolbar
    }
    
    func dismissKeyboard(){
        repeatPassword.resignFirstResponder()
        passwordRegistration.resignFirstResponder()
    }
    
    func keyboard(password: UITextField) -> Bool{
        password.resignFirstResponder()
        return true
    }

    



}
