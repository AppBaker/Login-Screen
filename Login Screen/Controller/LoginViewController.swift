//
//  LoginViewController.swift
//  Login Screen
//
//  Created by Ivan Nikitin on 06/03/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - ... Properties
    private let password = "123"
    private let userName = "lada"
    
    //MARK: - ...@IBOutlets
    @IBOutlet var userNameTextFIeld: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK: - ...@IBActions
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if userNameTextFIeld.text == "" && sender.tag == 0 || passwordTextField.text == "" && sender.tag == 0 {
            showAlert()
        } else {
            performSegue(withIdentifier: "SecondViewSegue", sender: sender)
        }
    }
    
    
    @IBAction func unwind(sender: UIStoryboardSegue){
        
    }
    //MARK: - ...ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextFIeld.delegate = self
        passwordTextField.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    //MARK: - ...Selectors
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: - ... Prepare fo segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SecondViewSegue" else { return }
        
        let controller = segue.destination as! SecondViewController
        
        let button = sender as! UIButton
        
        if button.tag == 0 {
            
            if userNameTextFIeld.text == userName && passwordTextField.text == password {
                controller.userName = userName
                controller.view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            } else {
                controller.userName = "Вы ввели не верное имя или пароль, попробуйте еще раз"
            }
            
        } else if button.tag == 1 {
            controller.userName = "Название популярного Российского автопроизводителя"
        } else if button.tag == 2 {
            controller.userName = "Это цифры: один два три"
        }
        
    }
    
    //MARK: - ... Alert
    func showAlert() {
        let alertController = UIAlertController(title: "Не все поля заполнены", message: "Пожалуйста введите имя пользователя и пароль.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
