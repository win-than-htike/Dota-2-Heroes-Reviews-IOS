//
//  Constants.swift
//  D2Heroes
//
//  Created by Win Than Htike on 8/22/17.
//  Copyright © 2017 Win Than Htike. All rights reserved.
//

import Foundation

class Constants{
    
    struct EventKey {
        public static let DATA = "data"
    }
    
    struct FirebaseNode {
        
        public static let AGILITY = "agility"
        public static let STRENGTH = "strength"
        public static let INTELLIGENCE = "intelligence"
        
    }
    
    struct NotificationKey {
        
        public static let AGILITY_NOTIFICATION_KEY : String = "AGILITY_NOTIFICATION_KEY"
        public static let STRENGTH_NOTIFICATION_KEY : String = "STRENGTH_NOTIFICATION_KEY"
        public static let INTELLIGENCE_NOTIFICATION_KEY : String = "INTELLIGENCE_NOTIFICATION_KEY"
        
    }
    
    struct HeroCellId {
        public static let HERO_CELLID = "heroCell"
    }
    
}
