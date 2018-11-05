//
//  HansMockAsyncTask.swift
//  AlamofireQueueDemo
//
//  Created by hans on 2018/11/4.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit

typealias HansRequest = (String,DispatchTime,((String) ->Void))
typealias Result = ((String) ->Void)
class HansMockAsyncTask: NSObject {
    static let shared = HansMockAsyncTask()
    let queue: DispatchQueue = {
        let queue = DispatchQueue(label: "network.task")
//        queue.suspend()
        return queue
    }()
    
    var requestArray :[(String,DispatchTime,((_ response: String) ->Void))] = []
    var isRequesting = false {
        didSet {
            if isRequesting == false {
                self.next()
            }
        }
    }
    
    func request(_ param: String?, _ after: DispatchTime, _ result: ((_ response: String) ->Void)?) {
        let ob = (param!,after,result!)
        requestArray.append(ob)
        print("request param: \(param ?? "")")
        if(isRequesting){
            return
        }
        queue.asyncAfter(deadline: after) {
            let res = param! + "==== response"
            print("response param: \(param ?? "") with param \(res)")
            if let rl = result {
                rl(res)
            }
            if let index = self.requestArray.enumerated().filter( { $0.element == ob }).map({ $0.offset }).first {
                self.requestArray.remove(at: index)
            }
        }
//        DispatchQueue.global().asyncAfter(deadline: after, execute: {
//            let res = param! + "==== response"
//            print("response param: \(param ?? "") with param \(res)")
//        })
    }
    
    func next()  {
        for request in requestArray {
            self.request(request.0, request.1, request.2)
        }
    }
}

//func ==(lhs: Result, rhs: Result) -> Bool {
//    //lhs.(_) == rhs.()
//    if lhs == rhs {
//        return true
//    }
//    return false
//}

func ==(lhs: HansRequest, rhs: HansRequest) -> Bool {
    if lhs.0 == rhs.0 && lhs.1 == rhs.1 {
        return true
    }
    return false
//    if lhs.item.count == rhs.item.count {
//        for (i, lhsDict) in lhs.item.enumerate() {
//            if lhsDict != rhs.item[i] {
//                return false
//            }
//        }
//        return true
//    }
//    else {
//        return false
//    }
}


extension DispatchTime: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = DispatchTime.now() + .seconds(value)
    }
}
extension DispatchTime: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = DispatchTime.now() + .milliseconds(Int(value * 1000))
    }
}

extension Array where Element: Equatable{
    mutating func remove (element: Element) {
        if let i = self.index(of: element) {
            self.remove(at: i)
        }
    }
}
//extension Array where Element: Equatable {
//
//    @discardableResult mutating func remove(object: Element) -> Bool {
//        if let index = index(of: object) {
//            self.remove(at: index)
//            return true
//        }
//        return false
//    }
//
//    @discardableResult mutating func remove(where predicate: (Array.Iterator.Element) -> Bool) -> Bool {
//        if let index = self.index(where: { (element) -> Bool in
//            return predicate(element)
//        }) {
//            self.remove(at: index)
//            return true
//        }
//        return false
//    }
//
//}

