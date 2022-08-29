//
//  ViewController.swift
//  Login
//
//  Created by Renan on 26/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var senha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func logar(_ sender: UIButton) {
        
        if(validarLogin(login: login, senha: senha)){
            print(validarCampoSenha(campo: senha))
        }else{
            limparCampo(campo: senha)
        }
        
    }
    
    func validarLogin(login: UITextField , senha: UITextField) -> Bool{
        return login.text == "renan" && validarCampoSenha(campo: senha)
    }
    
    func validarCampo(campo: UITextField) -> Bool {
        return campo.hasText
    }
    
    func validarCampoSenha(campo: UITextField) -> Bool {
        
        var check = false
        if(validarCampo(campo: campo) && checaSeStringEnula(campo: campo)){
            if(checaSeSenhaTemCaracterMaiusculo(campo: campo) && checaSeSenhaTemCaracterMinusculo(campo: campo) &&
               checaSeSenhaTemNumeral(campo: campo) && checaSeSenhaTemCaracterEspecial(campo: campo)){
                check = true
            }
        }
        return check
    }
    
    func checaSeSenhaTemCaracterMaiusculo(campo: UITextField) -> Bool {
        let range = NSRange(location: 0, length: campo.text!.utf16.count)
        let regex = try! NSRegularExpression(pattern: ".*[A-Z].*")
        return (regex.firstMatch(in: campo.text!, options: [], range: range) != nil)
    }
    
    func checaSeSenhaTemCaracterMinusculo(campo: UITextField) -> Bool {
        let range = NSRange(location: 0, length: campo.text!.utf16.count)
        let regex = try! NSRegularExpression(pattern: ".*[a-z].*")
        return (regex.firstMatch(in: campo.text!, options: [], range: range) != nil)
    }
    
    func checaSeSenhaTemNumeral(campo: UITextField) -> Bool {
        let range = NSRange(location: 0, length: campo.text!.utf16.count)
        let regex = try! NSRegularExpression(pattern: ".*[0-9]+.*")
        return (regex.firstMatch(in: campo.text!, options: [], range: range) != nil)
    }
    
    func checaSeSenhaTemCaracterEspecial(campo: UITextField) -> Bool {
        let range = NSRange(location: 0, length: campo.text!.utf16.count)
        let regex = try! NSRegularExpression(pattern: ".*[!&^%$#@()/]+.*")
        return (regex.firstMatch(in: campo.text!, options: [], range: range) != nil)
    }
    
    func checaSeStringEnula(campo: UITextField) -> Bool {
        return campo.text != nil
    }
    
    func limparCampo(campo: UITextField){
        campo.text = ""
    }
    
}

