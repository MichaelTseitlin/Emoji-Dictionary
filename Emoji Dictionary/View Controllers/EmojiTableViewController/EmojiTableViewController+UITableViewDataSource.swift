//
//  EmojiTableViewController+UITableViewDataSource.swift
//  Emoji Dictionary
//
//  Created by Denis Bystruev on 07.06.2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

// MARK: - UITableViewDataSource
extension EmojiTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Разное"
        case 1:
            return "Фрукты"
        case 2:
            return "Животные"
        case 3:
            return "Техника"
        default:
            fatalError()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell")!
        let emojiCell = cell as! EmojiTableViewCell
        let emojiSection = emojis[indexPath.section]
        let emoji = emojiSection[indexPath.row]
        cellManager.configure(emojiCell, with: emoji)
        return emojiCell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveEmoji = emojis[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        emojis[destinationIndexPath.section].insert(moveEmoji, at: destinationIndexPath.row)
        self.tableView.reloadData()
    }
}
