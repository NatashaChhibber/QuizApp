//
//  Question.swift
//  QuizDemo
//
//  Created by Appinventiv on 02/04/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import Foundation

class Question{
    let questionText: String
    let answer: Bool
    
    init(ques:String,ans:Bool) {
        self.questionText = ques
        self.answer = ans
    }
    
}
