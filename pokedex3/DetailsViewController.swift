//
//  DetailsViewController.swift
//  pokedex3
//
//  Created by mudasar on 04/11/2016.
//  Copyright © 2016 appinvent.uk. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet var pokedexIDLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var pokeImage: UIImageView!
    @IBOutlet var pokeEvoImage: UIImageView!
    
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var pokeEvoNextImage: UIImageView!
    @IBOutlet var pokemonTypeLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var defenceLabel: UILabel!
    @IBOutlet var baseAttackLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var pokeNextEvoLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = pokemon.name
        pokedexIDLabel.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetails{
            //update ui
            self.updateUI()
        }
    
    }

    func updateUI() {
        weightLabel.text = pokemon.weight
        heightLabel.text = pokemon.height
        baseAttackLabel.text = pokemon.baseAttack
        defenceLabel.text = pokemon.defence
        pokemonTypeLabel.text = pokemon.type
        pokeImage.image = UIImage(named: "\(pokemon.pokedexId)")
        pokeEvoImage.image = UIImage(named: "\(pokemon.pokedexId)")
        descriptionLabel.text = pokemon.description
        
        if pokemon.nextEvoId == "" {
            pokeEvoNextImage.isHidden = true
            pokeNextEvoLabel.text = "No Evolutions"
        }else {
            
            pokeNextEvoLabel.text = "Next Evolution: \(pokemon.nextEvoName) - \(pokemon.nextEvoLevel)"
            pokeEvoNextImage.isHidden = false
            pokeEvoNextImage.image = UIImage(named: "\(pokemon.nextEvoId)")
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
