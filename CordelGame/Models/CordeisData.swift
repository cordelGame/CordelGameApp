//
//  CordelData.swift
//  CordelGame
//
//  Created by Nathalia Cardoso on 26/03/21.
//

import Foundation

struct CordeisData {
    static let easy: [Cordel] = [ Cordel(name: "Draw01",
                                         winCondition: [["button1", "button4", "button3"],
                                                        ["button3", "button4", "button1"]]),
                                  Cordel(name: "Draw02",
                                         winCondition: [["button2", "button3", "button4"],
                                                        ["button4", "button3", "button2"]]),
                                  Cordel(name: "Draw03",
                                         winCondition: [["button1", "button3", "button2"],
                                                        ["button2", "button3", "button1"]]),
                                  Cordel(name: "Draw04",
                                         winCondition: [["button1", "button2", "button4"],
                                                        ["button4", "button2", "button1"]]),
                                  Cordel(name: "Draw05",
                                         winCondition: [["button4", "button1", "button3"],
                                                        ["button3", "button1", "button4"]])
                                ]

    static let medium: [Cordel] = [ Cordel(name: "Draw06",
                                           winCondition: [["button1", "button2", "button4", "button1"],
                                                          ["button1", "button4", "button2", "button1"],
                                                          ["button2", "button4", "button1", "button2"],
                                                          ["button2", "button1", "button4", "button2"],
                                                          ["button4", "button1", "button2", "button4"],
                                                          ["button4", "button2", "button1", "button4"]]),
                                    Cordel(name: "Draw07",
                                           winCondition: [["button1", "button2", "button3", "button1"],
                                                          ["button1", "button3", "button2", "button1"],
                                                          ["button2", "button3", "button1", "button2"],
                                                          ["button2", "button1", "button3", "button2"],
                                                          ["button3", "button1", "button2", "button3"],
                                                          ["button3", "button2", "button1", "button3"]]),
                                    Cordel(name: "Draw08",
                                           winCondition: [["button1", "button2", "button3", "button4"],
                                                          ["button4", "button3", "button2", "button1"]]),
                                    Cordel(name: "Draw09",
                                           winCondition: [["button1", "button4", "button3", "button2"],
                                                          ["button2", "button3", "button4", "button1"]])
                                  ]

    static let hard: [Cordel] = [ Cordel(name: "Draw10",
                                         winCondition: [["button2", "button4", "button1", "button3"],
                                                        ["button3", "button1", "button4", "button2"]]),
                                  Cordel(name: "Draw11",
                                         winCondition: [["button4", "button2", "button1", "button3"],
                                                        ["button3", "button1", "button2", "button4"]]),
                                  Cordel(name: "Draw12",
                                         winCondition: [["button1", "button2", "button4", "button3", "button1"],
                                                        ["button1", "button3", "button4", "button2", "button1"],
                                                        ["button2", "button4", "button3", "button1", "button2"],
                                                        ["button2", "button1", "button3", "button4", "button2"],
                                                        ["button3", "button4", "button2", "button1", "button3"],
                                                        ["button3", "button1", "button2", "button4", "button3"],
                                                        ["button4", "button2", "button1", "button3", "button4"],
                                                        ["button4", "button3", "button1", "button2", "button4"]]),
                                  Cordel(name: "Draw13",
                                         winCondition: [["button1", "button3", "button2", "button4", "button1"],
                                                        ["button1", "button4", "button2", "button3", "button1"],
                                                        ["button2", "button3", "button1", "button4", "button2"],
                                                        ["button2", "button4", "button1", "button3", "button2"],
                                                        ["button3", "button1", "button4", "button2", "button3"],
                                                        ["button3", "button2", "button4", "button1", "button3"],
                                                        ["button4", "button2", "button3", "button1", "button4"],
                                                        ["button4", "button1", "button3", "button2", "button4"]])
                                ]
}
