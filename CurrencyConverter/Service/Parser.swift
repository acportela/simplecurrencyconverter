//
//  Parser.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/3/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

public enum Parser {
    
    static func parse<T: Decodable>(dataType: T.Type = T.self, from data: Data) throws -> T {
        return try JSONDecoder().decode(dataType, from: data)
    }
    
    static func parse<T: Decodable>(dataType: T.Type = T.self,
                                    from data: Data,
                                    callback: (Result<T>) -> Void) {
        
        do {
            let object = try parse(dataType: dataType, from: data)
            callback(.success(object))
        } catch {
            callback(.failure(Errors.parsing))
        }
        
    }
    
}
