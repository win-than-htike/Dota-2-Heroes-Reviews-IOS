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
        
        heroRef = ref.child(heroType);
        heroRef.observe(.value, with: { (snapshot) in
            
            if let heroes = snapshot.children.allObjects as? [DataSnapshot] {
                
                for hero in heroes {
                    
                    if let h = hero.value as? [String : AnyObject] {
                        print(h["hero_name"] as! String)
                        NotificationCenter.post(<#T##NotificationCenter#>)
                    }
                    
                }
                
            } else {
                print("nil nil")
            }
            
        })
        
        
    }
    
}
