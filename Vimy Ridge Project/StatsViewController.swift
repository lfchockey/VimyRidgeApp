//
//  StatsViewController.swift
//  Vimy Ridge Project
//
//  Created by Mason Black on 2016-08-15.
//  Copyright © 2016 Mason Black. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var allStats = StatsReader(categories: "War Machines")
    
    @IBOutlet weak var statsSegControl: UISegmentedControl!
    @IBOutlet weak var statsTable: UITableView!
    
    @IBAction func statsCategorySelected(sender: AnyObject) {
        if sender.selectedSegmentIndex == 0 {
            allStats = StatsReader(categories: "War Machines")
        }
        else if sender.selectedSegmentIndex == 1 {
            allStats = StatsReader(categories: "Geography")
        }
        else if sender.selectedSegmentIndex == 2 {
            allStats = StatsReader(categories: "After Action Report")
        }
        else if sender.selectedSegmentIndex == 3 {
            allStats = StatsReader(categories: "The Boys")
        }
        else {
            allStats = StatsReader(categories: "War Machines")
        }
        statsTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.statsTable.delegate = self
        self.statsTable.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allStats.info.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = statsTable.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath as IndexPath);
        
        
        let keyName = Array(allStats.info.keys)[indexPath.row]
        let valueName = Array(allStats.info.values)[indexPath.row]
        let hypen = " - "

        cell.textLabel!.text = keyName + hypen + valueName
        //cell.textLabel!.text = Array(allStats.info.keys)[0]
        
        return cell
        
        
    }


}
