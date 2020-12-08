//
//  GetCommentResponse.swift
//  MVC-N
//
//  Created by Ann Yesip on 17.11.2020.
//

import Foundation
//тут будем получать комментарии
struct GetCommentResponse {
    typealias  JSON = [[String: AnyObject]]
    let comments: [Comment]
    
    init(json: Any) throws {
        guard let array = json as? JSON else { throw NetworkError.failinternetError}
        
        var comments = [Comment]()
        for dictionary in array {
            guard let comment = Comment(dict: dictionary) else { continue }
            comments.append(comment)
        }
        self.comments = comments
    }
}
