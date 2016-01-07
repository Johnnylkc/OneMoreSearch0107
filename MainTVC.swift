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
    //nil的意思就是以現在這個桌子顯示搜尋結果 當然也可以拿別的桌子來當作搜尋結果頁


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
        
        
        //下面這幾個就是UISearchController的基本設定
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        //如果是true 那案搜尋的時候就會讓桌子變暗
        
        searchController.definesPresentationContext = true
        //讓UISearchController搜尋完資料要顯示出來
        
        tableView.tableHeaderView = searchController.searchBar
        //就看要放在哪 當然也可以放在tableFooterView 只是我想應該沒有人會那樣做
    
    
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

    
    //基本上在numberOfRowsInSection和cellForRow都要判斷UISearchController有沒有被啟動 以及 輸入欄內有沒有打字
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
    
    
    
    //在didSelectRowAtIndexPath 一樣也要判斷搜尋有沒有被啟動 因為有啟動和沒啟動使用的model不同
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

        controller.newArray = candy
        
        self.navigationController?.pushViewController(controller, animated: true)
    }

    
    
 
    
    //我沒有做scopeBar 這裡的寫法是針對candy裡面的name做搜尋 而且只有小寫有效 大寫無效
    func filterContentForSearchText(searchText: String, scope: String = "All")
    {
        self.filteredCandies = candies.filter{ candy in
            return candy.name!.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }
    
   
    
    
    
    
   }///////////////整個table class的最後



/////下面這兩個方法 是一定要寫 但tutorial的做法是寫在整個桌子的外面
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










