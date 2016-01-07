//
//  MainTVC.swift
//  OneMoreSearch0107
//
//  Created by 劉坤昶 on 2016/1/7.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

import UIKit

class MainTVC: UITableViewController {
    
    var candies = [Candy]()
    var filteredCandies = [Candy]()
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.tableView.registerClass(MainCell.self, forCellReuseIdentifier: "cell")
        
        candies = [Candy(category: "chocolate", name: "001"),
                  Candy(category: "chocolate", name: "002"),
                  Candy(category: "chocolate", name: "003"),
                  Candy(category: "hard", name: "004"),
                  Candy(category: "hard", name: "005"),
                  Candy(category: "hard", name: "006"),
                  Candy(category: "other", name: "007"),
                  Candy(category: "other", name: "008"),
                  Candy(category: "other", name: "009")]
        
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       if searchController.active && searchController.searchBar.text != ""
       {
            return filteredCandies.count
        }
        
        return candies.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! MainCell
        
        let candy : Candy
        
        if searchController.active && searchController.searchBar.text != ""
        {
          candy = filteredCandies[indexPath.row]
        }
        else
        {
          candy = candies[indexPath.row]
        }
        
        cell.candyName.text = candy.name
        cell.candyType.text = candy.category
        

        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
       
        
        let controller = DetailVC()
        let candy : Candy
        if searchController.active && searchController.searchBar.text != ""
        {
            candy = filteredCandies[indexPath.row]
        }
        else
        {
            candy = candies[indexPath.row]
        }
       // let candy = candies[indexPath.row]
        controller.newArray = candy
        
        
        self.navigationController?.pushViewController(controller, animated: true)
    }

    
    
 
    
    
    func filterContentForSearchText(searchText: String, scope: String = "All")
    {
        self.filteredCandies = candies.filter{ candy in
            return candy.name!.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }
    
   
    
    
    
    
   }///////////////整個table class的最後


extension MainTVC: UISearchResultsUpdating
{
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

extension MainTVC: UISearchBarDelegate
{
    // MARK: - UISearchBar Delegate
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}










