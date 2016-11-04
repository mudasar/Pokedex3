//
//  Pokemon.swift
//  pokedex3
//
//  Created by mudasar on 04/11/2016.
//  Copyright © 2016 appinvent.uk. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Pokemon {
    private var _name:String!
    private var _description:String!
    private var _type:String!
    private var _defence:String!
    private var _height:String!
    private var _weight:String!
    private var _baseAttack:String!
    private var _nextEvoText: String!
    private var _pokemonUrl:String!
    private var _nextEvoName: String!
    private var _nextEvoId:String!
    private var _nextEvoLevel: String!
    
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
    
    var nextEvoName :String {
        if _nextEvoName == nil {
            _nextEvoName = ""
        }
        return _nextEvoName
    }
    
    var nextEvoId :String {
        if _nextEvoId == nil {
            _nextEvoId = ""
        }
        return _nextEvoId
    }
    
    var nextEvoLevel :String {
        if _nextEvoLevel == nil {
            _nextEvoLevel = ""
        }
        return _nextEvoLevel
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
        self._pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId!)/"
        
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        print(self._pokemonUrl)
        let url = URL(string: self._pokemonUrl)!
        Alamofire.request(url).responseJSON(completionHandler: { (response) in
            let result = response.result
            print(result.value)
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Double {
                    self._baseAttack = "\(attack)"
                }
                if let defense = dict["defense"] as? Double {
                    self._defence = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, AnyObject>] , types.count > 0 {
                    var typelist = [String]()
                    for type in types {
                        if let name = type["name"] as? String {
                            typelist.append(name.capitalized)
                        }
                    }
                    self._type = typelist.joined(separator: "/")
                }                
                if let descs = dict["descriptions"] as? [Dictionary<String, AnyObject>], descs.count > 0 {
                    //just taking the firsts one
                    if let url = descs[0]["resource_uri"] as? String  {
                        Alamofire.request(  "\(URL_BASE)\(url)").responseJSON(completionHandler: {(resp) in
                            if let res = resp.result.value as? Dictionary<String, AnyObject> {
                                if let description = res["description"] as? String {
                                    self._description = description
                                }
                            }
                        })
                    }
                    
                }
                
                //evolution information
                
                if let evos = dict["evolutions"] as? [Dictionary<String, AnyObject>] , evos.count > 0 {
                    if let nextEvo = evos[0]["to"] as? String {
                        if nextEvo.range(of: "mega") == nil {
                            self._nextEvoName = nextEvo
                            
                            if let uri = evos[0]["resource_uri"] as? String {
                                let replaceduri = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let newId = replaceduri.replacingOccurrences(of: "/", with: "")
                                self._nextEvoId = newId
                            }
                            
                            if let level = evos[0]["level"] as? String {
                                if  level != "" {
                                    let nextL = Int(level)
                                     self._nextEvoLevel = "\(nextL)"
                                }else{
                                    self._nextEvoLevel = ""
                                }
                            }
                        }
                    }
                }
                
            }
            
         completed()
        })  
            
        }
        
    }
    
    
    

