//
//  Service.swift
//  iOSTask
//
//  Created by Fuad Hasan on 21/5/21.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    
    typealias completion = ((Result<Results, Error>)->())
    
    
    func fetchUser(urlString:String,completionHandler:@escaping completion) {
        
        guard let url = URL(string: urlString) else {
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data else {return}
            
            do {
                let result = try JSONDecoder().decode(Results.self, from: data)
                print(result)
                completionHandler(.success(result))
                
                
            } catch let error {
                
                completionHandler(.failure(error))
            }
            
        }.resume()
        
        
    }
    
}
