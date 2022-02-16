//
//  ViewController.swift
//  FaceRecognition
//
//  Created by ece on 16.02.2022.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func singInClicked(_ sender: Any) {
        
        //dogrulama işlemleri için kullanılan obje
        let authContext = LAContext()
              
              var error: NSError?
              
              if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                  
                  authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { (success, error) in
                      if success == true {
                          //successful auth
                          DispatchQueue.main.async {
                              self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                          }
                      } else {
                          DispatchQueue.main.async {
                              self.label.text = "Error!"
                          }
                      }
                  }
                  
                  
              }
    }
}

