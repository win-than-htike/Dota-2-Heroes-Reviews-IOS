//
//  IntelligenceViewController.swift
//  D2Heroes
//
//  Created by Win Than Htike on 8/22/17.
//  Copyright © 2017 Win Than Htike. All rights reserved.
//

import UIKit

class IntelligenceViewController: UIViewController {

    @IBOutlet weak var intellTableView: UITableView!
    
    var heroes : [Heros] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CustomLoadingView.shared().showActivityIndicator(uiView: self.view)
        
        self.intellTableView.separatorColor = UIColor.clear
        
        NotificationCenter.default.addObserver(forName:NSNotification.Name(rawValue: Constants.NotificationKey.INTELLIGENCE_NOTIFICATION_KEY), object:nil, queue:nil, using:loadedIntelligenceHeroes)
        
        registerCell()
        
        HeroModel.shared().loadHeroes(heroType: Constants.FirebaseNode.INTELLIGENCE)
        
    }
    
    func registerCell(){
        let cellNib = UINib(nibName : "HeroTableViewCell", bundle : nil)
        intellTableView.register(cellNib, forCellReuseIdentifier: Constants.HeroCellId.HERO_CELLID)
    }
    
    func loadedIntelligenceHeroes(notification: Notification) -> Void{
        
        if let data = notification.userInfo![Constants.EventKey.DATA] as? [Heros] {
            
            self.heroes.removeAll()
            self.heroes.append(contentsOf: data)
            self.intellTableView.reloadData()
            CustomLoadingView.shared().hideActivityIndicator(uiView: self.view)
            
        } else {
            print("ototot")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "heroDetail" {
            
            if let destination = segue.destination as? HeroDetailViewController {
                
                if let hero : Heros = sender as? Heros {
                    destination.hero = hero
                }
                
            }
            
        }
        
        
    }
    
}

extension IntelligenceViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.HeroCellId.HERO_CELLID,for: indexPath) as! HeroTableViewCell
        
        let currentHero = heroes[indexPath.row]
        cell.heroName.text = currentHero.hero_name
        cell.heroRole.text = currentHero.hero_role
        cell.ivHero.sd_setImage(with: URL(string: currentHero.hero_image))
        
        
        return cell
    }
    
}

extension IntelligenceViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "heroDetail", sender: self.heroes[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        
        UIView.animate(withDuration: 0.5){
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        }
        
    }
    
}

