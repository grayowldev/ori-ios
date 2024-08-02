//
//  NetworkManager.swift
//  Ori
//
//  Created by Kwasi Nsiah on 7/6/24.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://tontally-core-production.up.railway.app/"
    
    private let orderingURL = baseURL + "ori/ordering"
    private let inventoryURL = baseURL + "bulkItem/getAllBulkItems"
    
    private init() {}
    
    func getOrders(completed: @escaping (Result<[OriOrder], APIError>) -> Void) {
        guard let url = URL(string: orderingURL) else {
            completed(.failure(.invalidURL))
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ =  error {
                completed(.failure(.unableToComplete))
                print("Unable to complete for some reason")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completed(.failure(.invalidResponse))
                print("Invalid response")
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                print("Invalid data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([OriOrder].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
                print("in do failure")
            }
        }
        
        task.resume()
    }
    
    func getIInventoryItems(completed: @escaping (Result<[OriInventoryItem], APIError>) -> Void) {
        guard let url = URL(string: inventoryURL) else {
            completed(.failure(.invalidURL))
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ =  error {
                completed(.failure(.unableToComplete))
                print("Unable to complete for some reason")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completed(.failure(.invalidResponse))
                print("Invalid response, response code: ", response)
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                print("Invalid data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([OriInventoryItem].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
                print("in do failure")
            }
        }
        
        task.resume()
    }
}
