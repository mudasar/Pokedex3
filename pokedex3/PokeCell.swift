//
//  PokeCell.swift
//  pokedex3
//
//  Created by mudasar on 04/11/2016.
//  Copyright © 2016 appinvent.uk. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var thumbImage:UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    

    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
        
    }
    
    
    func configureCell(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        self.nameLabel.text = pokemon.name.capitalized
        self.thumbImage.image = UIImage(named: "\(pokemon.pokedexId)")
    }
    
}
