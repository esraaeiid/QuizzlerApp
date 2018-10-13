//
//  Questions.swift
//  Quizzler
// question form

import Foundation

class Questions{
    let questionText : String
    let answer : Bool
    
    init(text : String, correctAnswer: Bool) {
    questionText = text
    answer = correctAnswer
    }
    
}
