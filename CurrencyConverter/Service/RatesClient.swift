//
//  RatesClient.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/3/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
import Alamofire

protocol APIClient {
    func requestDecodable<T: Decodable>(request: URLRequest, callback: @escaping (Result<T>) -> Void)
}

class RatesClient: SessionManager, APIClient {
    
    public static let sharedClient: APIClient = {
        return RatesClient()
    }()
    
    func requestDecodable<T: Decodable>(request: URLRequest, callback: @escaping (Result<T>) -> Void) {
        
        self.request(request: request) { resp in
            
            switch resp {
            case .success(let data):
                
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    callback(.success(object))
                } catch {
                    callback(.failure(Errors.parsing))
                }
                
            case .failure(let error):
                callback(.failure(error))
            }
            
        }
        
    }
    
    func request(request: URLRequest, callback: @escaping (Result<Data>) -> Void) {
        
        if !NetworkReachabilityManager()!.isReachable {
            callback(.failure(Errors.connectivity))
            return
        }
        
        self.request(request).validate(statusCode: 200..<300).responseData { response in
            
            guard response.result.error == nil else {
                callback(.failure(Errors.connectivity))
                return
            }
            
            guard let data = response.data else {
                callback(.failure(Errors.connectivity))
                return
            }
            
            callback(.success(data))
            
        }
    }
    
}
