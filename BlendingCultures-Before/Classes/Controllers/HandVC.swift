//
//  HandVC.swift
//  BlendingCultures-Before
//
//  Created by Kenzo on 2016/03/05.
//  Copyright © 2016年 Karuta. All rights reserved.
//

import UIKit

class HandVC: UITableViewController {

    private let hand = Hand()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addNewCard:")
        self.navigationItem.rightBarButtonItem = addButton
        self.tableView.registerClass(CardCell.self, forCellReuseIdentifier: "cardCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addNewCard(sender: UIBarButtonItem) {
        if hand.numberOfItems < 5 {
            hand.addNewItemAtIndex(0)
            self.insertTopRow()
        }
    }
    
    private func insertTopRow() {
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hand.numberOfItems
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cardCell", forIndexPath: indexPath) as? CardCell
        let card = hand.cardAtPosition(indexPath.row)
        cell!.rankLabel.text = card.rank.description
        cell!.rankLabel.textColor = card.color
        cell!.suitLabel.text = card.suit.description
        return cell!
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            hand.deleteCardAtIndex(indexPath.row)
            self.deleteRowAtIndexPath(indexPath)
        }
    }
    
    private func deleteRowAtIndexPath(indexPath: NSIndexPath) {
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        hand.moveCard(fromIndexPath.row, toIndex: toIndexPath.row)
    }

}
