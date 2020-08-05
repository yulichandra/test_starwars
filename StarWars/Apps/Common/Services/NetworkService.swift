//
//  NetworkService.swift
//  StarWars
//
//  Created by Ari Munandar on 05/08/20.
//  Copyright © 2020 CoderLyn. All rights reserved.
//

import Foundation
import Alamofire

protocol IApiClient {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
    func request<T: Decodable>(completion: ((Result<BaseEntity<T>, AFError>) -> Void)?)
}

extension IApiClient {
    var baseUrl: String {
        return "https://swapi.dev/api/"
    }

    func request<T: Decodable>(completion: ((Result<BaseEntity<T>, AFError>) -> Void)?) {
        DispatchQueue.global(qos: .background).async {
            AF.request(
                self.path,
                method: self.method,
                parameters: self.parameters,
                encoding: self.encoding,
                headers: self.headers
            ).responseData { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
                            decoder.dateDecodingStrategy = .iso8601
                        }

                        guard let _data = try? decoder.decode(BaseEntity<T>.self, from: data) else {
                            return
                        }
                        completion?(.success(_data))
                    }
                case .failure(let error):
                    completion?(.failure(error))
                }
            }
        }
    }
}
