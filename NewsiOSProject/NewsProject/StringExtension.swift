//
//  StringExtension.swift
//  NewsProject
//
//  Created by QUYTECH_ankit_ios on 13/07/20.
//  Copyright © 2020 QUYTECH. All rights reserved.
//

import Foundation

extension String {
   
    var isValidUserName: Bool {
        let regex = "^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    
    var isValidEmail: Bool {
    let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
    return predicate.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
    let regex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
    return predicate.evaluate(with: self)
    }
    
}
