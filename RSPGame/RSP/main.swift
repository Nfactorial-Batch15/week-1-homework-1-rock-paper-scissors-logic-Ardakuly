
import Foundation

//
//  main.swift
//  RSP
//
//  Created by Alisher Anuarbekov on 28.03.2023.
//



enum Gestures: Int {
    
    case scissors = 1
    case paper = 2
    case rock = 3
    
}

class User {
    
    var name: String
    var gesture: Gestures?
    
    init(name: String) {
        self.name = name
    }
    
    func makeGesture(gesture: Gestures) {
        self.gesture = gesture;
    }
    
}

protocol Rules {
    
    func start();
    
}


class Game : Rules {
    
    var player1: User
    var player2: User
    
    init(player1: User, player2: User) {
        
        self.player1 = player1
        self.player2 = player2
        
    }
    
    func start() {
        
        print("Choose Gesture: 1. scissors 2. paper 3. rock");
        
        print("\(self.player1.name) choose one gesture: ")
        
        let read1: String? = readLine()
        
        print("\(self.player2.name) choose one gesture: ")
        
        let read2: String? = readLine()
        
        self.player1.makeGesture(gesture: defineGesture(gesture: read1!))
        self.player2.makeGesture(gesture: defineGesture(gesture: read2!))
        
        let player1Choice = player1.gesture!.rawValue
        let player2Choice = player2.gesture!.rawValue
        
        if player1Choice == 1 && player2Choice == 3 {
            print("\(player2.name) has won")
            return
        } else if player1Choice == 3 && player2Choice == 1 {
            print("\(player1.name) has won")
            return
        } else if player1Choice < player2Choice {
            print("\(player1.name) has won")
            return
        } else if player1Choice > player2Choice {
            print("\(player2.name) has won")
            return
        }
        
        
        
        
    }
    
    private func defineGesture(gesture: String) -> Gestures {
        
        var result: Gestures
        
        switch gesture {
        case "scissors":
            result = .scissors
        case "paper":
            result = .paper
        case "rock":
            result = .rock
        default:
            result = .rock
        }
        
        return result
        
    }

}


var rspGame: Game = Game(player1: User(name: "Alisher"), player2: User(name: "Raimberk"))

rspGame.start()
                         
        
