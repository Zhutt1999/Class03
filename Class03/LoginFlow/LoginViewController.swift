//
//  LoginViewController.swift
//  Class03
//
//  Created by stu-40 on 2019/7/11.
//  Copyright © 2019 苹果工坊. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController ,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        self.view.endEditing(true)
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard
            
            let textFieldText = textField.text
            ,
            let rangeOfTextToReplace = Range(range, in: textFieldText)
            
            
            else {
                return false
                }
        
        
        
        
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        
        print("tag:\(textField.tag)")
        
        if textField.tag==1{
            return count <= 5
        }
        else if textField.tag==2{
            return count <= 7
        }
        
        return false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
