//
//  Pentominoes.swift
//  Assets for Assignment 4
//
//  Created by Alfares, Nader on 1/28/23.
//
import Foundation


//Mark:- Shapes models
struct Point : Decodable, Hashable {
    let x : Int
    let y : Int
}

struct Size : Decodable {
    let width : Int
    let height : Int
}

typealias Outline = [Point]

struct PentominoOutline : Decodable {
    let name : String
    let size : Size
    let outline : Outline
}

struct PuzzleOutline : Decodable {
    let name : String
    let size : Size
    let outlines : [Outline]
}

//Mark:- Pieces Model

// specifies the complete position of a piece using unit coordinates
struct Position {
    var x : Int = 0
    var y : Int = 0
}

// a Piece is the model data that the view uses to display a pentomino
struct Piece {
    var position : Position = Position()
    var outline : PentominoOutline
}
