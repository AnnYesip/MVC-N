//
//  CommentNetworkService.swift
//  MVC-N
//
//  Created by Ann Yesip on 17.11.2020.
//

import Foundation
//местный менеджер
class CommentNetworkService{
    private init(){}
//    при вызове метода получаем обьект который запонит некий массив комментариев 
    static func getComments(completion: @escaping(GetCommentResponse) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else {return}
//       получаем данные по адресу 
        NetworkService.shared.getData(url: url) { (json) in
            do{
                let response = try GetCommentResponse(json: json)
                completion(response) // передаем дальше
            } catch {
                print( error )
            }
        }
    }
}
