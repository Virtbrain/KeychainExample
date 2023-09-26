//
//  ViewController.swift
//  KeychainExample
//
//  Created by Alexey Manankov on 24.09.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getPassword()
        
    }
    
    func getPassword() {
        guard let res = KeychainManager.get(
                service: "Swift.me",
                account: "Skaledra"
        ) else {
            print("Failed to read password")
            return
        }
        
        let password = String(decoding: res, as: UTF8.self)
        print("A password is \(password)")
    }
    
    func save() {
        do {
            try KeychainManager.save(
                    service: "Swift.me",
                    account: "Skaledra",
                    password: "JjJqwe123".data(using: .utf8) ?? Data()
                )
        } catch {
            print(error)
        }
    }
}

