//
//  StoreManagerClass.swift
//  vcardX
//
//  Created by Nicolas Ott on 06.06.21.
//

import Foundation
import StoreKit

class StoreManager: NSObject, ObservableObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    //FETCH PRODUCTS
    var request: SKProductsRequest!
    
    @Published var myProducts = [SKProduct]()
    
    func getProducts(productIDs: [String]) {
        //NSLog("Start requesting products ...")
        let request = SKProductsRequest(productIdentifiers: Set(productIDs))
        request.delegate = self
        request.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        //NSLog("Did receive response")
        
        if !response.products.isEmpty {
            
            
            let goodProducts = response.products
            
            if !goodProducts.isEmpty {
                
                let validProducts = response.products
                var productsArray = [SKProduct]()
                for i in 0 ..< validProducts.count {
                    let product = validProducts[i]
                    productsArray.append(product)
                }
                productsArray.sort{(Double(truncating: $0.price) < Double(truncating: $1.price))}
                for fetchedProduct in productsArray  {
                    DispatchQueue.main.async {
                        self.myProducts.append(fetchedProduct)
                    }
                }
                
            }
        }
        
        for invalidIdentifier in response.invalidProductIdentifiers {
            NSLog("Invalid identifiers found: \(invalidIdentifier)")
        }
    }
    
    func getPriceFormatted(for product: SKProduct) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = product.priceLocale
        return formatter.string(from: product.price)
    }
    
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        NSLog("Request did fail: \(error)")
    }
    
    //HANDLE TRANSACTIONS
    @Published var transactionState: SKPaymentTransactionState?
    
    func purchaseProduct(product: SKProduct) {
        if SKPaymentQueue.canMakePayments() {
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(payment)
        } else {
            NSLog("User can't make payment.")
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                transactionState = .purchasing
            case .purchased:
                UserDefaults.standard.setValue(true, forKey: transaction.payment.productIdentifier)
                queue.finishTransaction(transaction)
                transactionState = .purchased
            case .restored:
                UserDefaults.standard.setValue(true, forKey: transaction.payment.productIdentifier)
                queue.finishTransaction(transaction)
                transactionState = .restored
            case .failed, .deferred:
                NSLog("Payment Queue Error: \(String(describing: transaction.error))")
                queue.finishTransaction(transaction)
                transactionState = .failed
            default:
                queue.finishTransaction(transaction)
            }
        }
    }
    
    func restoreProducts() {
        NSLog("Restoring products ...")
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}




