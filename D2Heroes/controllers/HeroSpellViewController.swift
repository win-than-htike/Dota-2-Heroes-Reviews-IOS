//
//  HeroSpellViewController.swift
//  D2Heroes
//
//  Created by Win Than Htike on 8/24/17.
//  Copyright © 2017 Win Than Htike. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "spellCell"

class HeroSpellViewController: UIViewController {
    
    @IBOutlet weak var heroSpellCollectionView: UICollectionView!
    
    var spells : [HeroSpell]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension HeroSpellViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spells.count
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SpellCollectionViewCell
        
            let currentSpell = spells[indexPath.row]
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = UIColor(red : 208/255, green : 208/255, blue : 208/255, alpha : 1.0).cgColor
            cell.ivSpell.sd_setImage(with: URL(string: (currentSpell).spell_image))
            cell.spellName.text = currentSpell.spell_name
        
        return cell
        
    }
    
}

extension HeroSpellViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let alert = UIAlertController(title: self.spells[indexPath.row].spell_name, message: self.spells[indexPath.row].spell_overview, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
