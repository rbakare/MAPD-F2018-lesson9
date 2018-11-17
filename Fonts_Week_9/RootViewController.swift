//
//  RootViewController.swift
//  Fonts_Week_10
//
//  Created by macbook on 16.11.2018.
//  Copyright © 2018 CentennialCollege. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    
      private var familyNames: [String]!
      // containt font size
      private var cellPointSize: CGFloat!
      // pointer
      private var favoritesList: FavoritesList!
      private static let familyCell = "FamilyName"
      private static let favoritesCell = "Favorites"
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    
        
     
    
           familyNames = (UIFont.familyNames as [String]).sorted()
           let preferredTableViewFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
    
           cellPointSize = preferredTableViewFont.pointSize
           favoritesList = FavoritesList.sharedFavoritesList
           tableView.estimatedRowHeight = cellPointSize
       }
    
    
   
    
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           tableView.reloadData()
       }
    
    
       func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont? {
           if indexPath.section == 0 {
               let familyName = familyNames[indexPath.row]
               let fontName = UIFont.fontNames(forFamilyName: familyName).first
               return fontName != nil ?
                   UIFont(name: fontName!, size: cellPointSize ): nil
           } else {
               return nil
           }
    
       }
    
       override func numberOfSections(in tableView: UITableView) -> Int{
           return favoritesList.favorites.isEmpty ? 1 : 2
       }
    
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int ) -> Int {
           return section == 0 ? familyNames.count : 1
       }
    
       // specify the title
    
       override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return section == 0 ? "All Font Familes": "My Favorite Fonts"
       }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation}
 
    
    
    
    
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           if indexPath.section == 0 {
               // the font names list
               let cell = tableView.dequeueReusableCell(withIdentifier: RootViewController.familyCell, for: indexPath)
               cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath as NSIndexPath)
               cell.textLabel?.text = familyNames[indexPath.row]
               cell.detailTextLabel?.text = familyNames[indexPath.row]
               return cell
           } else {
               // The favorites list
               return tableView.dequeueReusableCell(withIdentifier: RootViewController.favoritesCell, for: indexPath)
           }
       }
    
    
    
    
            //

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//  override func numberOfSections(in tableView: UITableView) -> Int {
//      // #warning Incomplete implementation, return the number of sections
//      return 0
//  }

//  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//      // #warning Incomplete implementation, return the number of rows
//      return 0
//  }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */





