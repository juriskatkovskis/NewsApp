//
//  NetworkManager.swift
//  NewsApp
//
//  Created by juris.katkovskis on 25/08/2022.
//

import Foundation


class NetworkManager{
    
    static var apiKey = "3442e6b2442948d2bf7334fdae6a62bb"
       static var searchResult = "apple"
       
       static func fetchData(completion: @escaping ([Article]) -> () ){
           
           guard let url = URL(string: "https://newsapi.org/v2/everything?q=\(searchResult)&from=2022-08-13&to=2022-08-23&sortBy=popularity&apiKey=\(apiKey)") else {return}
           
           
           var request = URLRequest(url: url)
           request.httpMethod = "GET"
           
           let config = URLSessionConfiguration.default
           config.waitsForConnectivity = true
           
           URLSession(configuration: config).dataTask(with: request) { data, response, error in
               
               guard error == nil else {
                   print((error?.localizedDescription)!)
                   return
               }
               
               guard let data = data else {
                   print(String(describing:error))
                   return
               }

               do{
                   let jsonData = try JSONDecoder().decode(NewsItem.self, from: data)
                   completion(jsonData.articles ?? [])
               }catch{
                   print("err:::", error)
               }
               
               
           }.resume()
           
       }
       
    
    
    
}
