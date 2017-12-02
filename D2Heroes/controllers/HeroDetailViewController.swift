//
//  HeroDetailViewController.swift
//  D2Heroes
//
//  Created by Win Than Htike on 8/23/17.
//  Copyright © 2017 Win Than Htike. All rights reserved.
//

import UIKit

private let reuseIdentifier = "spellCell"

class HeroDetailViewController: UIViewController {
    
    @IBOutlet weak var ivHero: UIImageView!
    
    @IBOutlet weak var intellLabel: UILabel!
    
    @IBOutlet weak var agilityLabel: UILabel!
    
    @IBOutlet weak var strengthLabel: UILabel!
    
    @IBOutlet weak var attackSpeedLabel: UILabel!
    
    @IBOutlet weak var movementSpeedLabel: UILabel!
    
    @IBOutlet weak var armorLabel: UILabel!
    
    @IBOutlet weak var heroRoleLabel: UILabel!
    
    
    @IBOutlet weak var heroOverviewLabel: UILabel!
    
    
    @IBOutlet weak var heroDetailLabel: UILabel!
    
    var hero : Heros?
    
//    @IBOutlet weak var spellCollectionView: UICollectionView!
    
    var spells : [HeroSpell] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let h = hero {
            
            ivHero.sd_setImage(with: URL(string: h.hero_image))
            self.navigationItem.title = h.hero_name
            bindData(h)
        }
        
        print(AppDelegate.isFav)
        AppDelegate.isFav = true
        
    }
    
    func bindData(_ h : Heros){
        
        intellLabel.text = h.hero_intellgience
        agilityLabel.text = h.hero_agility
        strengthLabel.text = h.hero_strength
        attackSpeedLabel.text = h.hero_damage
        movementSpeedLabel.text = h.hero_movement_speed
        armorLabel.text = h.hero_armor
        heroRoleLabel.text = h.hero_role
        
        heroOverviewLabel(h.hero_overview)
        
        heroDetailLabel(h.hero_detail)
        
    }
    
    func heroOverviewLabel(_ overview : String){
        
        let attrString = NSMutableAttributedString(string: overview)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 8
        style.minimumLineHeight =  8
        attrString.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: NSRange(location: 0, length: attrString.length))
        
        heroOverviewLabel.attributedText = attrString
        
    }
    
    func heroDetailLabel(_ detail : String){
        
        let attrString = NSMutableAttributedString(string: detail)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 8
        style.minimumLineHeight = 8
        attrString.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: NSRange(location: 0, length: attrString.length))
        
        heroDetailLabel.attributedText = attrString
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("didAppear => \(spells.count)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "heroSpellSegue" {
            if let dist = segue.destination as? HeroSpellViewController {
                dist.spells = hero?.hero_spell
            }
        } else if segue.identifier == "overview" {
            
            if let dist = segue.destination as? HeroInfoViewController {
                dist.heroOverview = hero?.hero_overview
            }
            
        } else if segue.identifier == "detail" {
            
            if let dist = segue.destination as? HeroInfoViewController {
                dist.heroOverview = hero?.hero_detail
            }
            
        }
        
    }

}


