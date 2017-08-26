//
//  StrengthViewController.swift
//  D2Heroes
//
//  Created by Win Than Htike on 8/22/17.
//  Copyright © 2017 Win Than Htike. All rights reserved.
//

import UIKit
import FirebaseDatabase

class StrengthViewController: UIViewController {
    
    var ref : DatabaseReference!
    var heroRef : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
        loadHeroes(heroType: "strength")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func loadHeroes(heroType : String){
        
        
        
        
    }

}

extension StrengthViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

extension StrengthViewController : UITableViewDelegate {
    
}
