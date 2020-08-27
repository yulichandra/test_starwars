//
//  ApiService.swift
//  StarWars
//
//  Created by Ari Munandar on 05/08/20.
//  Copyright © 2020 CoderLyn. All rights reserved.
//

import Alamofire
import Foundation

enum AResult<Success, Failure> {
    case success(Success)
    case failure(Failure)
}

protocol APIService {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
    func request<T: Decodable>(completion: ((AResult<BaseEntity<T>, GeneralError>) -> Void)?)
}

extension APIService {
    var baseUrl: String {
        return "https://swapi.dev/api/"
    }

    func request<T: Decodable>(completion: ((AResult<BaseEntity<T>, GeneralError>) -> Void)?) {
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
                        if let statusCode = response.response?.statusCode {
                            switch statusCode {
                            case 200..<300:
                                let decoder = JSONDecoder()
                                if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
                                    decoder.dateDecodingStrategy = .iso8601
                                }
                                
                                guard let _data = try? decoder.decode(BaseEntity<T>.self, from: data) else {
                                    completion?(.failure(GeneralError(data: response.data, errorState: .other)))
                                    return
                                }
                                completion?(.success(_data))
                            default:
                                var errorState: ErrorState = .other
                                if let state = ErrorState(rawValue: statusCode) {
                                    errorState = state
                                }
                                completion?(.failure(GeneralError(data: response.data, errorState: errorState)))
                            }
                        }
                    }
                case .failure(let error):
                    var errorState: ErrorState = .other
                    if let code = (error.underlyingError as NSError?)?.code, let state = ErrorState(rawValue: code) {
                        errorState = state
                    }
                    completion?(.failure(GeneralError(data: response.data, errorState: errorState)))
                }
            }
        }
    }
}

enum ErrorState: Int {
    case noInternet = -1009
    case notFound = 404
    case other

    var message: String {
        switch self {
        case .noInternet:
            return "No Internet Access"
        case .notFound:
            return "Not Found"
        default:
            return "Ops, Someting wrong, please try again."
        }
    }
}

struct GeneralError {
    var errorState: ErrorState = .other
    var message: String?
    var data: [String: Any]?

    init(data: Data?, errorState: ErrorState) {
        setDataError(data: data, errorState: errorState)
    }

    mutating func setDataError(data: Data?, errorState: ErrorState) {
        do {
            if let data = data, let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                self.data = json
                self.errorState = errorState
            } else {
                self.data = nil
                self.errorState = .other
            }
        } catch let error as NSError {
            if let errorState = ErrorState(rawValue: error.code) {
                self.errorState = errorState
            } else {
                self.errorState = .other
            }
        }
        message = errorState.message
    }
}
