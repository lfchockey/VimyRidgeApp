//
//  CollapsibleTableViewController.swift
//  ios-swift-collapsible-table-section
//
//  Created by Yong Su on 5/30/16.
//  Copyright © 2016 Yong Su. All rights reserved.
//

import UIKit

//
// MARK: - Section Data Structure
//
struct Section {
    var name: String!
    var items: [String]!
    var collapsed: Bool!
    
    init(name: String, items: [String], collapsed: Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

//
// MARK: - View Controller
//
class StatsTableViewController: UITableViewController {
    
    let warMachines = StatsReader(categories: "War Machines")
    let geography = StatsReader(categories: "Geography")
    let afterActionReport = StatsReader(categories: "After Action Report")
    let theBoys = StatsReader(categories: "The Boys")

//    let keyName = Array(allStats.info.keys)[indexPath.row]
//    let valueName = Array(allStats.info.values)[indexPath.row]
//    let hypen = " - "
//    
//    cell.textLabel!.text = keyName + hypen + valueName

    
    var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Stats"
        
//        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 32, height: 44))
//        self.view.addSubview(navBar);
//        let navItem = UINavigationItem(title: "Back");
//        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: Selector("Stats"));
//        navItem.rightBarButtonItem = doneItem;
//        navBar.setItems([navItem], animated: false);
        
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "old paper.jpg"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(backButtonClick), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        
        self.navigationItem.setRightBarButtonItems([item1], animated: true)
        
        // War Machines
        var wmArray = [String]()
        
        for ben in warMachines.info {
            
            wmArray.append(ben.key + " - " + ben.value)
            
        }
        
       
        //Geography
        var geoArray = [String]()
            
        for ben in geography.info {
                
            geoArray.append(ben.key + " - " + ben.value)
            
        }
            
        //After Action Report
        var afterActionReportArray = [String]()
            
        for ben in afterActionReport.info {
                
            afterActionReportArray.append(ben.key + " - " + ben.value)
            
        }
        
        //The Boys
        var theBoysArray = [String]()
            
        for ben in theBoys.info {
                
            theBoysArray.append(ben.key + " - " + ben.value)
    
       }
        
        //print (wmArray)
        
        // Initialize the sections array
        // Here we have three sections: Mac, iPad, iPhone
        sections = [
            Section(name: "War Machines", items: wmArray),
            Section(name: "Geography", items: geoArray),
            Section(name: "After Action Report", items: afterActionReportArray),
            Section(name: "The Boys", items: theBoysArray),
        ]
    }
    
    func backButtonClick () {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let exampleViewController: HistoryViewController = mainStoryboard.instantiateViewController(withIdentifier: "History") as! HistoryViewController
        
        
        self.view.window!.rootViewController = exampleViewController
        
        
        
    
    }
    
    

    
}

//
// MARK: - View Controller DataSource and Delegate
//
extension StatsTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    // Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> BensTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BensTableViewCell? ?? BensTableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13.0 )
//        cell.myLabel1?.text = "Ben"
//        cell.myLabel2?.text = "Seward"
        cell.myImage?.image = UIImage(named: "old paper.jpg")
        //var  imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height)
        //cell.imageView?.image =
        //cell.imageView?.frame = CGRect (x: 25, y: 25, width: 25, height: 25)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[(indexPath as NSIndexPath).section].collapsed! ? 0 : 44.0
    }
    
    // Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        header.titleLabel.text = sections[section].name
        header.arrowLabel.text = ">"
        header.setCollapsed(sections[section].collapsed)
        
        header.section = section
        header.delegate = self
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }

}

//
// MARK: - Section Header Delegate
//
extension StatsTableViewController: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
        // Adjust the height of the rows inside the section
        tableView.beginUpdates()
        for i in 0 ..< sections[section].items.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
}
