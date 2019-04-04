//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Shalise Ayromloo on 3/30/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//


import UIKit

@objc protocol ToDoCellDelegate: class {
    func checkmarkTapped(sender: ToDoCell)
} //closes ToDoCellDelegate

class ToDoCell: UITableViewCell {
    var delegate: ToDoCellDelegate?
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func completeButtonTapped() {
        delegate?.checkmarkTapped(sender: self)
    } //closes IBAction
} //closes class
