//
//  PostViewController.swift
//  Tweeter
//
//  Created by Saqib Bhatti on 07/04/2019.
//  Copyright © 2019 Saqib Bhatti. All rights reserved.
//

import UIKit

let numberOfCharactersPerLine = 46

class PostViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var tweetTextView: UITextView!
    
    var message:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // this method will make sure that input message length will be atleat 1.
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let newMessage = tweetTextView.text {
            if newMessage.count == 0 {
                return false
            }
        }
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Send the message as it is if it's less than 50 characters
        if let newMessage = tweetTextView.text,
            newMessage.count <= 50 {
            message = [newMessage]
        }
        
        if let newMessage = tweetTextView.text,
            newMessage.count > 50 {
            
            // If input message is greater than 50 characters without any whitespace, display the error
            if(!newMessage.contains(" ")) {
                message = ["Whitespace Error"]
            }
            else {
                // If input message is greater than 50 characters call the splitMessage function
                let splitted = splitMessage(msg: newMessage)
                message = splitted
            }
        }
    }
    
    
    // The following function will split the input message if it has more than 50 characters.
    //Algorithm: Convert the input string into array and traverse the whole array once. On every whitespace, store the
    // word in a variable and before appending the next word, check that size will be less than or equal to 50
    // or not. Messages are divided by "," character.
    
    func splitMessage(msg:String) -> [String] {
        
        var splitMessage = [String]()
        let arrayMessage = Array(msg)
        var word = String()
        var lineNumber = 1
        var part = String()
        
        let lines = numberOfSplitMessages(numberOfCharacters:msg.count)
        print(msg.count)
        
        part.append("\(lineNumber)/\(lines)")
        
        for (index, character) in arrayMessage.enumerated() {
            
            if((character != " ") && (index != arrayMessage.endIndex-1)) {
                word.append(character)
            }
            else {
                if(index == arrayMessage.endIndex-1) {
                    word.append(character)
                    part.append(" ")
                }
                //print("part.count:\(part.count), word.count:\(word.count)")
                if((part.count + word.count + 1) <= 50) {
                    if(part.last != " ") {
                        part.append(" ")
                    }
                    part.append(word)
                    word.removeAll()
                    
                    if(index == arrayMessage.endIndex-1)  {
                        splitMessage.append(part)
                    }
                    
                }
                else {
                    splitMessage.append(part)
                    lineNumber+=1
                    if(splitMessage.last == " ") {
                        splitMessage.removeLast()
                    }
                    splitMessage.append(",")
                    part.removeAll()
                    part.append("\(lineNumber)/\(lines) ")
                    part.append(word)
                    
                    if(index == arrayMessage.endIndex-1) {
                        splitMessage.append(word)
                    }
                    word.removeAll()
                }
            }
        }

        print(splitMessage.count)
        
        // After the message has been splitted, convert it into array and return
        for _ in splitMessage {
            if let index = splitMessage.index(of: ",") {
                splitMessage.remove(at: index)
            }
        }
        print(splitMessage.count)
        print(splitMessage)
        
        return splitMessage
    }
    
    
    // The following method will calculate the number of parts(lines) the input message will be splitted
    func numberOfSplitMessages(numberOfCharacters:Int) -> Int {
        let quotient = numberOfCharacters / numberOfCharactersPerLine
        var lines = 0
        
        if((numberOfCharacters % numberOfCharactersPerLine) > 0) {
            lines = quotient + 1
        }
        
        if((numberOfCharacters % numberOfCharactersPerLine) == 0) {
            lines = quotient
        }
        
        return lines
    }
}
