//
//  CommentCell.swift
//  MVC-N
//
//  Created by Ann Yesip on 17.11.2020.
//

import UIKit


class CommentCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    func configure(with comment: Comment){
        self.label.text = comment.name
        self.textView.text = comment.body
    }
    
}
