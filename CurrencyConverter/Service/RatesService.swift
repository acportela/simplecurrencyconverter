//
//  RatesService.swift
//  CurrencyConverter
//
//  Created by Antonio Rodrigues on 3/3/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation

protocol RatesServiceProtocol {
    
    typealias RatesResult = Result<RatesResponse>
    
    func fetchLatestRates(for currency: Currency, callback: @escaping (RatesResult) -> Void)
    
}

class RatesService: RatesServiceProtocol {
    
    let apiClient: APIClient
    
    init(client: APIClient = RatesClient.sharedClient) {
        self.apiClient = client
    }
    
    func fetchLatestRates(for currency: Currency, callback: @escaping (RatesResult) -> Void) {
        
        let urlString = Constants.BaseURL.rates + currency.rawValue.uppercased()
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let request = URLRequest(url: url)
        
        apiClient.requestDecodable(request: request) { (result: RatesResult) in
            
            switch result {
                
            case .success(let response):
                callback(.success(response))
                
            case .failure(let error):
                callback(.failure(error))
            }
            
        }
        
    }
    
}
