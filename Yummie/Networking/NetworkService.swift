//
//  NetworkService.swift
//  Yummie
//
//  Created by Andrew Emad on 09/10/2022.
//

import Foundation

struct NetworkService {

    static let shared = NetworkService()
    private init(){}
    

    func placeOrder(dishID: String, name: String, completion: @escaping(Result<Order,Error>)->Void){
        request(route: .PlaceOrder(dishID: dishID), method: .post,parameters: ["name":name] ,completion: completion)
    }
    func fetchCategoriesAPI(completion: @escaping(Result<AllCategories,Error>)->Void){
        request(route: .fetchAllCategories, method: .get, completion: completion)
    }
    func fetchCategoriesByIDAPI(categoryID: String, completion: @escaping(Result<[Dish],Error>)->Void){
        request(route: .FetchDishesByCategory(categoryID: categoryID), method: .get, completion: completion)
    }
    func fetchOrders(completion: @escaping(Result<[Order],Error>)->Void){
        request(route: .getOrders, method: .get, completion: completion)
    }
    
    private func request<T:Codable>(route: Route, method: Method, parameters: [String:Any]? = nil, completion: @escaping(Result<T,Error>)->Void){
        guard let request = createRequest(route: route, method: method, parameters: parameters) else{
            completion(.failure(AppError.unknownError))
            return
        }
        print(request.url!)
        URLSession.shared.dataTask(with: request){ data,response,error in
            var result : Result<Data,Error>
            if let error = error {
                result = .failure(error)
                completion(.failure(AppError.serverError(error.localizedDescription)))
            }else if let data = data {
                result = .success(data)
                handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    /// Parse the response of calling the API
    /// - Parameters:
    ///   - result: enum with success or failure
    ///   - completion: call the completion after finishing the parsing
    private func handleResponse<T:Decodable>(result: Result<Data,Error>,
                                             completion: @escaping(Result<T,Error>)->Void){
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(APIResponse<T>.self, from: data) else{
                completion(.failure(AppError.errorDecoding))
                return
            }
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
                return
            }
            if let decodedData = response.data {
                completion(.success(decodedData))
            }else{
                completion(.failure(AppError.unknownError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    /// - Parameters: This function helps us to generate a urlRequest
    ///   - route: the path to the resource in the backend
    ///   - method: HTTP Method(get,post...etc)
    ///   - parameters: extra information to be added to the url request
    /// - Returns: URLRequest
    private func createRequest(route: Route, method: Method, parameters: [String:Any]? = nil) -> URLRequest? {
        let urlString = route.fullURLPath
        guard let url = urlString.toURl  else {return nil}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        if let parameters = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = parameters.map({URLQueryItem(name: $0, value: "\($1)")})
                urlRequest.url = urlComponent?.url
            case .post,.delete,.patch:
                urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            }
        }
        return urlRequest
    }
}
