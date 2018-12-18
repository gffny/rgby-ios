//
//  RGBYDataAPI.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/11/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import SystemConfiguration

class RGBYDataAPI {
    
    static var API_SCHEME = "https"
    static var API_HOST = "s3.amazonaws.com"
    static var BASE_API = "/rgby-cch/api/"
    static var BASE_COACH_API = BASE_API + "coach/"
    static var BASE_TEAM_API = BASE_API + "team/"
    static var SQUAD_LIST = "squad/list.json"
    static var SQUAD_API = "squad/"
    static var MATCH_LIST = "match/list.json"
    static var MATCH_API = "match/"

    static func getSquadList(onSuccess success: @escaping ([RGBYPlayer]) -> Void, onFailure failure: @escaping (Error?) -> Void) {
        let task = URLSession(configuration: URLSessionConfiguration.default).dataTask(with: formatGetRequest(url: formatAPIRequestURL(path: BASE_TEAM_API + "1234567/" + SQUAD_LIST))) { (responseData, response, responseError) in
            guard responseError == nil else {
                failure(responseError!)
                return
            }
            // APIs usually respond with the data you just sent in your POST request
            if let data = responseData, let _ = String(data: data, encoding: .utf8) {
                do {
                    //Decode JSON Response Data
                    let playerList = try JSONDecoder().decode([RGBYPlayer].self, from: responseData!)
                    success(playerList)
                } catch let parsingError {
                    print("Error", parsingError)
                }
            } else {
                print("no readable data received in response")
                failure(nil)
            }
        }
        task.resume()
    }

    static func getMatchList(teamId:String, onSuccess success: @escaping ([RGBYMatch]) -> Void, onFailure failure: @escaping (Error?) -> Void) {
        
        
        let task = URLSession(configuration: URLSessionConfiguration.default).dataTask(with: formatGetRequest(url: formatAPIRequestURL(path: BASE_TEAM_API + teamId + "/" + MATCH_LIST))) { (responseData, response, responseError) in
            guard responseError == nil else {
                failure(responseError!)
                return
            }
            
            // APIs usually respond with the data you just sent in your POST request
            if responseData != nil {
                do {
                    //Decode JSON Response Data
//                    let matchList = try JSONDecoder().decode([RGBYMatch].self, from: responseData!)
                    success([])
                } catch let parsingError {
                    print("Error", parsingError)
                }
            } else {
                print("no readable data received in response")
                failure(nil)
            }
        }
        task.resume()
    }

    static func getCoach(id: String, onSuccess success: @escaping (RGBYCoach) -> Void, onFailure failure: @escaping (Error?) -> Void, onOffline offline: @escaping () -> Void) {
        
        if !Reachability.isConnectedToNetwork() {
            offline()
            return
        }

        let task = URLSession(configuration: URLSessionConfiguration.default).dataTask(with: formatGetRequest(url: formatAPIRequestURL(path: BASE_COACH_API+id+".json"))) { (responseData, response, responseError) in
            guard responseError == nil else {
                failure(responseError!)
                return
            }
            // APIs usually respond with the data you just sent in your POST request
            if let data = responseData {
                do {
                    //Decode JSON Response Data
                    let coach = try JSONDecoder().decode(RGBYCoachCodable.self, from: data)
                    success(coach.getModel())
                } catch let parsingError {
                    print("Error", parsingError)
                }
            } else {
                print("no readable data received in response")
                failure(nil)
            }
        }
        task.resume()
    }

    static func formatAPIRequestURL(path: String) -> URL {
        print("format api request from string: \(path)")
        // create url components
        var urlComponents = URLComponents()
        urlComponents.scheme = API_SCHEME
        urlComponents.host = API_HOST
        urlComponents.path = path
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        return url
    }

    static func formatGetRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        // Make sure that we include headers specifying that our request's HTTP body
        // will be JSON encoded
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        return request
    }
}

class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }

        /* Only Working for WIFI
         let isReachable = flags == .reachable
         let needsConnection = flags == .connectionRequired
         
         return isReachable && !needsConnection
         */
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }
}
