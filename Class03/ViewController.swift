//
//  ViewController.swift
//  Class03
//
//  Created by stu-40 on 2019/7/10.
//  Copyright © 2019 苹果工坊. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,AsyncReponseDelegate {
    func receviedReponse(_ sender: AsyncRequestWorker, responseString: String, tag: Int) {
        
        print(responseString)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let worker : AsyncRequestWorker=AsyncRequestWorker()
        worker.reponseDelegate=self
        worker.取得回应(from: "https://google.com", tag: 1)
        
 //        NotificationCenter.default.addObserver(self, selector: #selector(收到远端信息keyboardWillShow(notification:)), name: NSNotification.Name(rawValue: "response.received"), object: nil)
    }
    @objc func 收到远端信息keyboardWillShow(notification: NSNotification) {
        
        let hope : String = notification.userInfo!["response"] as! String
        
        print(hope)
        
//        let keyboardHeight = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
//        print("猜猜看：\(keyboardHeight)")
 //       btnGoBottomConstraint.constant = keyboardHeight
    }

}

