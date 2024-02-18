import Foundation
import Security

class KeychainWrapper {

    static func savePassword(_ password: String, forAccount account: String) {
        if let data = password.data(using: .utf8) {
            saveData(data, forAccount: account)
        }
    }

    static func saveEmail(_ email: String, forAccount account: String) {
        if let data = email.data(using: .utf8) {
            saveData(data, forAccount: account)
        }
    }

    static func getPassword(forAccount account: String) -> String? {
        if let data = getData(forAccount: account) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }

    static func getEmail(forAccount account: String) -> String? {
        if let data = getData(forAccount: account) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }

    private static func saveData(_ data: Data, forAccount account: String) {
        deleteData(forAccount: account)

        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecValueData as String: data
        ]

        SecItemAdd(query as CFDictionary, nil)
    }

    private static func getData(forAccount account: String) -> Data? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecReturnData as String: true
        ]

        var data: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &data)

        if status == errSecSuccess {
            return data as? Data
        } else {
            return nil
        }
    }

    private static func deleteData(forAccount account: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account
        ]

        SecItemDelete(query as CFDictionary)
    }
}
