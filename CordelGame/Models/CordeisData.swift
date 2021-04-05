//
//  CordelData.swift
//  CordelGame
//
//  Created by Nathalia Cardoso on 26/03/21.
//

import Foundation

struct CordeisData {
    static let easy: [Cordel] = [Cordel(name: "Cordel", winCondition:
                                            [["button1", "button2", "button3", "button4"],
                                             ["button4", "button3", "button2", "button1"]]),
                                 Cordel(name: "Calango(1)", winCondition:
                                            [["button1", "button2", "button3"],
                                            ["button3", "button2", "button1"]])]
    static let medium: [Cordel] = [Cordel(name: "Cordel", winCondition:
                                            [["button1", "button2", "button3", "button4"],
                                             ["button4", "button3", "button2", "button1"]])]
    static let hard: [Cordel] = [Cordel(name: "Cordel", winCondition:
                                            [["button1", "button2", "button3", "button4"],
                                             ["button4", "button3", "button2", "button1"]])]
}
