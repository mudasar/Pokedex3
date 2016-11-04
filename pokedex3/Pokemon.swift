//
//  Pokemon.swift
//  pokedex3
//
//  Created by mudasar on 04/11/2016.
//  Copyright © 2016 appinvent.uk. All rights reserved.
//

import Foundation
import UIKit

class Pokemon {
    private var _name:String!
    private var _description:String!
    private var _type:String!
    private var _defence:String!
    private var _height:String!
    private var _weight:String!
    private var _baseAttack:String!
    private var _nextEvoText: String!
    
    private var _pokedexId: Int!
    
     var name :String {
        if _name == nil {
            _name = ""
        }
            return _name
    }
    
    var description :String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var defence :String {
        if _defence == nil {
            _defence = ""
        }
        return _defence
    }
    
    var type :String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var height :String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight :String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var baseAttack :String {
        if _baseAttack == nil {
            _baseAttack = ""
        }
        return _baseAttack
    }
    
    var nextEvoText :String {
        if _nextEvoText == nil {
            _nextEvoText = ""
        }
        return _nextEvoText
    }
    
    var pokedexId : Int {
        
        if _pokedexId == nil {
            _pokedexId = 0
        }
        
        return _pokedexId
    }
    
    
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
    
}
