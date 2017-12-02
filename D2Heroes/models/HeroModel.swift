//
//  HeroModel.swift
//  D2Heroes
//
//  Created by Win Than Htike on 8/22/17.
//  Copyright © 2017 Win Than Htike. All rights reserved.
//

import Foundation
import FirebaseDatabase

class HeroModel {
    
    var ref : DatabaseReference!
    var heroRef : DatabaseReference!
    
    private static var sharedHeroModel: HeroModel = {
        let heroModel = HeroModel()
        return heroModel
    }()
    
    private init() {
        ref = Database.database().reference()
    }
    
    class func shared() -> HeroModel {
        return sharedHeroModel
    }
    
    public func loadHeroes(heroType : String){
        
        var heroeAry : [Heros] = []
        
        heroRef = ref.child(heroType);
        heroRef.observe(.value, with: { (snapshot) in
            
            if let heroes = snapshot.children.allObjects as? [DataSnapshot] {
                
                heroeAry.removeAll()
                for hero in heroes {
                    
                    if let h = hero.value as? [String : AnyObject] {
                        
                        let singleHero = Heros()
                        singleHero.hero_image = h["hero_image"] as! String
                        singleHero.hero_name = h["hero_name"] as! String
                        singleHero.hero_role = h["hero_role"] as! String
                        singleHero.hero_agility = h["hero_agility"] as! String
                        singleHero.hero_intellgience = h["hero_intellgience"] as! String
                        singleHero.hero_strength = h["hero_strength"] as! String
                        singleHero.hero_damage = h["hero_damage"] as! String
                        singleHero.hero_armor = h["hero_armor"] as! String
                        singleHero.hero_movement_speed = h["hero_movement_speed"] as! String
                        singleHero.hero_detail = h["hero_detail"] as! String
                        singleHero.hero_overview = h["hero_overview"] as! String
                        
                        self.ref.child(heroType).child(hero.key).child("hero_spell").observe(.value, with: { (spell) in
                            
                            if let spells = spell.children.allObjects as? [DataSnapshot] {
                                
                                for sp in spells
                                {
                                    if let s = sp.value as? [String : AnyObject] {
                                        
                                        let singleSpell = HeroSpell()
                                        singleSpell.spell_name = s["spell_name"] as! String
                                        singleSpell.spell_image = s["spell_image"] as! String
                                        singleSpell.spell_overview = s["spell_overview"] as! String
                                        singleHero.hero_spell.append(singleSpell)
                                        
                                    }
                                }
                            } else {
                                print("hehehehe")
                            }
                            
                        })
                        
                        heroeAry.append(singleHero)
                        
                    }
                    
                }
                
                print("notifyed")
                self.sendData(heroType, heroeAry)
                
            } else {
                print("nil nil")
            }
            
        })
        
    }
    
    private func sendData(_ heroType : String, _ heroList : [Heros]){
        
        switch heroType {
            
        case Constants.FirebaseNode.STRENGTH:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.NotificationKey.STRENGTH_NOTIFICATION_KEY), object: nil, userInfo: [Constants.EventKey.DATA : heroList])
            break
            
        case Constants.FirebaseNode.AGILITY:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.NotificationKey.AGILITY_NOTIFICATION_KEY), object: nil, userInfo: [Constants.EventKey.DATA : heroList])
            break
            
        case Constants.FirebaseNode.INTELLIGENCE:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.NotificationKey.INTELLIGENCE_NOTIFICATION_KEY), object: nil, userInfo: [Constants.EventKey.DATA : heroList])
            break
            
        default:
            print("Unknow Hero Type")
        }
        
    }
    
}
