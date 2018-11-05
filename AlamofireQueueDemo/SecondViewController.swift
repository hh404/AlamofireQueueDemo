//
//  SecondViewController.swift
//  AlamofireQueueDemo
//
//  Created by hans on 2018/11/4.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    let mock = HansMockAsyncTask.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.yellow
        let btn1 = UIButton(frame: CGRect(x: 10, y: 100, width: 120, height: 40))
        btn1.setTitle("resume Queue", for: .normal)
        btn1.backgroundColor = UIColor.green
        btn1.addTarget(self, action: #selector(btnClick1), for: .touchUpInside)
        self.view.addSubview(btn1)
        
        let btn2 = UIButton(frame: CGRect(x: 10, y: 150, width: 120, height: 40))
        btn2.setTitle("send", for: .normal)
        btn2.backgroundColor = UIColor.green
        btn2.addTarget(self, action: #selector(btnClick2), for: .touchUpInside)
        self.view.addSubview(btn2)
        
        let btn3 = UIButton(frame: CGRect(x: 10, y: 200, width: 120, height: 40))
        btn3.setTitle("back", for: .normal)
        btn3.backgroundColor = UIColor.green
        btn3.addTarget(self, action: #selector(btnClick3), for: .touchUpInside)
        self.view.addSubview(btn3)
        
        mock.request("sencond00", 2) { (_) in
            print("sssss")
        }
    }
    
    @objc func btnClick1()  {
       // mock.queue.suspend()
        mock.isRequesting = false
    }
    
    @objc func btnClick2()  {
        mock.request("sencond11", 5) { (_) in
            print("sssss")
        }
    }
    
    @objc func btnClick3()  {
        self.dismiss(animated: true) {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("deinit")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
