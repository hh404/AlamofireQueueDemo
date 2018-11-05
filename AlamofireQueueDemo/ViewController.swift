//
//  ViewController.swift
//  AlamofireQueueDemo
//
//  Created by hans on 2018/11/4.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    let mock = HansMockAsyncTask.shared
    
    var data: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btn = UIButton(frame: CGRect(x: 10, y: 100, width: 120, height: 40))
        btn.setTitle("suspend Queue", for: .normal)
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        self.view.addSubview(btn)
        
        
        let btn1 = UIButton(frame: CGRect(x: 10, y: 160, width: 120, height: 40))
        btn1.setTitle("next", for: .normal)
        btn1.backgroundColor = UIColor.green
        btn1.addTarget(self, action: #selector(btnClick1), for: .touchUpInside)
        self.view.addSubview(btn1)
        
        let btn3 = UIButton(frame: CGRect(x: 10, y: 200, width: 120, height: 40))
        btn3.setTitle("resume queue", for: .normal)
        btn3.backgroundColor = UIColor.green
        btn3.addTarget(self, action: #selector(btnClick3), for: .touchUpInside)
        self.view.addSubview(btn3)
        
        mock.request("1", 6) { (_) in
            
        }
        mock.request("2", 2) { (_) in
            
        }
//        mock.queue.suspend()
//        mock.request("3", 2) { (_) in
//
//        }
//        mock.request("4", 2) { (_) in
//
//        }
    }
    
    @objc func btnClick()  {
        //mock.queue.resume()
        mock.isRequesting = true
    }
    
    @objc func btnClick1()  {
        //mock.queue.resume()
        let vc = SecondViewController()
        self.present(vc, animated: true) {
            
        }
    }
    
    @objc func btnClick3()  {
        mock.isRequesting = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func handleRequest() {
        // do something...
        data = "数据"
        print("处理数据")
        // 唤醒队列
//        queue.resume()
    }
    
    /*@discardableResult
    public func request(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)
        -> DataRequest
    {
        return SessionManager.default.request(
            url,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers
        )
    }
    
    @discardableResult
    public func responseJSON(compeletionHandler: @escaping (_ data: String) -> ()) -> Self {
        print("response任务加入队列")
       queue.async {
            print("response任务开始执行 - 当前线程:\(Thread.current)")
            DispatchQueue.main.async {
                print("开始执行response任务回调 - 当前线程:\(Thread.current)")
                compeletionHandler(self.data)
            }
        }
        return self
    }*/

    
    // extension DataRequest
//    @discardableResult
//    public func responseJSON(
//        queue: DispatchQueue? = nil,
//        options: JSONSerialization.ReadingOptions = .allowFragments,
//        completionHandler: @escaping (DataResponse<Any>) -> Void)
//        -> Self  // 这里的Self 就是 DataRequest
//    {
//        return response(
//            queue: queue,
//            responseSerializer: DataRequest.jsonResponseSerializer(options: options),
//            completionHandler: completionHandler
//        )
//    }
    
}

