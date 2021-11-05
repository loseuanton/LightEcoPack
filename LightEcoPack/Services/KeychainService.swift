//
//  KeychainService.swift
//  LightEcoPack
//
//  Created by Admin on 8.10.21.
//

import Foundation
import Security


final class KeychainService {
    
    @discardableResult
    static func add(login: String, password: String) -> Bool {
        
        if let passwordData = password.data(using: .utf8) {
            let keychainItemQuery = [
                kSecValueData: passwordData,
                kSecClass: kSecClassGenericPassword,
                kSecAttrAccount: login
            ] as CFDictionary
            let status = SecItemAdd(keychainItemQuery, nil)
            print("Operation finished with status: \(status)")
            
            return status == 0
        }
        return false
    }
    
    static func getPasssword(login: String) -> String? {
    
        let keychainItemQuery = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: login,
            kSecMatchLimit: kSecMatchLimitOne,
            kSecReturnData: true
        ] as CFDictionary
        var item: AnyObject?
        let status = SecItemCopyMatching(keychainItemQuery, &item)
        if let passwordData = item as? Data {
            print("Operation finished with status: \(status)")
            let password = String(data: passwordData, encoding: .utf8)
            print(password)
            return password
        }
        return nil
    
    }
    
    static func update(login: String, newPassword: String) -> Bool {
        let keychainItemQuery = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: login
        ] as CFDictionary
        if let passwordData = newPassword.data(using: .utf8) {
            let updateItem = [kSecValueData: passwordData] as CFDictionary
            let status = SecItemUpdate(keychainItemQuery, updateItem)
            print("Operation finished with status: \(status)")
            return status == 0
        }
        return false
        
    }
    static func removePassword(login: String) -> Bool {
        let keychainItemQuery = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: login
        ] as CFDictionary
        
        let status = SecItemDelete(keychainItemQuery)
        print("Operation finished with status: \(status)")
        return status == 0
        
    }
    
    
}
