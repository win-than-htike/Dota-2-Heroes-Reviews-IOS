//
//  HeroInfoViewController.swift
//  D2Heroes
//
//  Created by Win Than Htike on 8/26/17.
//  Copyright © 2017 Win Than Htike. All rights reserved.
//

import UIKit

class HeroInfoViewController: UIViewController {

    
    @IBOutlet weak var overview: UILabel!
    
    var heroOverview : String?
    
    var heroDetail : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let ov = heroOverview {
            
            let attrString = NSMutableAttributedString(string: ov)
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 8
            style.minimumLineHeight =  8
            attrString.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: NSRange(location: 0, length: attrString.length))
            overview.attributedText = attrString
            
        }
        
        if let de = heroDetail {
            
            let attrString = NSMutableAttributedString(string: de)
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 8
            style.minimumLineHeight =  8
            attrString.addAttribute(NSAttributedStringKey.paragraphStyle, value: style, range: NSRange(location: 0, length: attrString.length))
            overview.attributedText = attrString
            
        }
        
    }

}
