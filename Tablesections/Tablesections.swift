//
//  Tablesections.swift
//  Tablesections
//
//  Created by appinventiv on 25/08/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class Tablesections: UIViewController {
    
    
    @IBOutlet var tableview: UITableView!
    
    
    let sectionArray = ["animal"]
    let animalArray = ["dog", "cat", "rabbit","dog", "cat", "rabbit","dog", "cat", "rabbit","dog", "cat", "rabbit"]
    var tapOrNot = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    self.tableview.dataSource = self
    self.tableview.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapBtn(_ sender: UIButton) {

       // sender.isSelected = !sender.isSelected
        self.tapOrNot = !self.tapOrNot

        self.tableview.reloadSections([0], with: .automatic)
    }
    
}
    

extension Tablesections : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.tapOrNot == false{
            return 0
        }
        return self.animalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Sections") as? Sections
            else{
                fatalError()
        }
        cell.tapBtn.isUserInteractionEnabled = false
        cell.tapBtn.setTitle(animalArray[indexPath.row], for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String?{
        return self.sectionArray[section]

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Sections") as? Sections
            else{
            fatalError()
        }
        cell.tapBtn.isUserInteractionEnabled = true

        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }

}
class Sections : UITableViewCell {
    @IBOutlet var tapBtn: UIButton!
    
    override func awakeFromNib() {
    }
    
}
class Details: UITableViewCell {
    
}
