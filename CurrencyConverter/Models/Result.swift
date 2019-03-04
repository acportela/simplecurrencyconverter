//
//  Result.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/3/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

enum Result<T> {
    case success(T)
    case failure(Error)
}
