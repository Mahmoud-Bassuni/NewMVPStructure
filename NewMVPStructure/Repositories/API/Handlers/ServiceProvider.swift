//
//  ServiceProvider.swift
//  NetworkLayer
//
//  Created by Mahmoud Basyouny on 3/29/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation

class ServiceProvider<T: ServiceLayer> {
    var urlSession = URLSession.shared
    
    init() { }
    
    // without codable result
    func load(service: T, completion: @escaping (Result<Data>) -> Void) {
        call(service.urlRequest, completion: completion)
    }
    
    // with codable result
    func load<U>(service: T, decodeType: U.Type, completion: @escaping (Result<U>) -> Void) where U: Decodable {
        call(service.urlRequest) { result in
            
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let resp = try decoder.decode(decodeType, from: data)
                    completion(.success(resp))
                }
                catch {
                    let err = ApiError(status: 0, message: error.localizedDescription)
                    completion(.failure(err))
                }
                
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
}

extension ServiceProvider {
    private func call(_ request: URLRequest, deliverQueue: DispatchQueue = DispatchQueue.main, completion: @escaping (Result<Data>) -> Void) {
        urlSession.dataTask(with: request) { (data, response, error) in
            
            guard ConnectionManger.shared.isReachable else {
                completion(.failure(ApiError(status: 0, message: "checkInternet")))
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse, error == nil , 200 ..< 300 ~= httpResponse.statusCode else {
                
                let httpResponse = response as? HTTPURLResponse
                let code = httpResponse?.statusCode
                
                deliverQueue.async {
                    switch code {
                    case nil :
                        completion(.failure(ApiError(status: 0, message: "bad connection")))
                        break
                    case 404 :
                        completion(.failure(ApiError(status: 404, message: "e404")))
                        break
                    case 401 :
                        //  LogoutService.shared.logout()
                        completion(.failure(ApiError(status: 401, message: "e401")))
                        break
                    case 403 :
                        completion(.failure(ApiError(status: 403, message: "e403")))
                        break
                    case 500 :
                        completion(.failure(ApiError(status: 500, message: "e500")))
                        break
                    default :
                        completion(.failure(ApiError(status: 0, message: "bad connection")))
                        break
                    }
                }
                return
            }
            
            deliverQueue.async {
                
                let customError = self.getStandardAPIException(data: data)
                customError == nil ? completion(.success(data)) :  completion(.failure(customError!))
                
            }
            
        }.resume()
    }
    
    private  func getStandardAPIException(data : Data) -> ApiError? {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
            let status: Int = json != nil ? json!.has(key: "status") ? json!["status"] as! Int : 0 : 0
            let message: String = json != nil ?  json!.has(key: "message") ? json!["message"] as! String : "" : ""
            if (status != 0) {
                return ApiError(status: status, message: message)
            }
            else {
                return nil
            }
        } catch {
            return nil
        }
    }
    
}

