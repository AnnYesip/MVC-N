//
//  NetworkService.swift
//  MVC-N
//
//  Created by Ann Yesip on 17.11.2020.
//

import Foundation
// общий менеджер для работы с сетью
//синглтон (паттерн такой)
class NetworkService{
    private init() {}
    
    static let shared = NetworkService()
    
    public func getData(url: URL, completion: @escaping (Any) -> ()) {
        let session = URLSession.shared
        
//        преобразуем полученные даные в jason -обьект
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                передаем то что получилось дальше 
                DispatchQueue.main.async{ //обновление интерфейса в главном потоке
                    completion(json)
                }
            }catch{
                print(error)
            }
        }.resume()
    }
}
