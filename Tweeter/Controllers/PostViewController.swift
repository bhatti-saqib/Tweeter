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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newMessage = tweetTextView.text,
            newMessage.count <= 50 {
            message = [newMessage]
        }
        
        if let newMessage = tweetTextView.text,
            newMessage.count > 50 {
            
            if(!newMessage.contains(" ")) {
                message = ["Whitespace Error"]
            }
            else {
                let splitted = splitMessage(msg: newMessage)
                message = splitted
            }
        }
    }
    
    
    
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
        
        for _ in splitMessage {
            if let index = splitMessage.index(of: ",") {
                splitMessage.remove(at: index)
            }
        }
        print(splitMessage.count)
        print(splitMessage)
        
        return splitMessage
    }
    
    
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
