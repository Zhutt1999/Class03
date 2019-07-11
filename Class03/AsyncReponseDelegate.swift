//
//  AsyncRequestWorker.swift
//  MVCDemo
//
//  Created by 房懷安 on 2019/2/1.
//  Copyright © 2019 房懷安. All rights reserved.
//

import Foundation
import UIKit

protocol AsyncReponseDelegate {
    func receviedReponse(_ sender: AsyncRequestWorker, responseString : String, tag : Int) -> Void
}

class AsyncRequestWorker {
    
    var reponseDelegate : AsyncReponseDelegate?
    
    func 取得回应(from:String, tag:Int) -> Void {
        
        // 服务器请求的目标路径。给网址
        let url = URL(string: from)!
        
        //构造URLRequest对象，服务器执行指定的请求目标路径为url给出的网址
        let request = URLRequest(url: url)
        
        //默认configuration（配置）创建方式
        //（使用硬盘上持久化全局缓存、证书(credential)和cookie的存储对象）
        let config = URLSessionConfiguration.default
        
        //接受config来的配置请求
        let session = URLSession(configuration: config)
        
        //处理从http中得到的请求，从服务器获取数据到内存中
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            //强制转换
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if( 200 == statusCode){
                
                //data强制转换String
                let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let responseString = String( dataString! )
                
                //
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "response.received"), object: self, userInfo: ["response": responseString])
                
                self.reponseDelegate?.receviedReponse(self, responseString: responseString, tag: tag)
            }
        })
        task.resume()
    }
}
