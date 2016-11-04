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
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = pokemon.name
        pokedexIDLabel.text = "\(pokemon.pokedexId)"
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
