//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Shalise Ayromloo on 3/30/19.
//  Copyright © 2019 Shalise Ayromloo. All rights reserved.
//



import UIKit

class ToDoViewController: UITableViewController {
    
    var todo: ToDo?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePickerView: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = todo {
            navigationItem.title = "To-Do"
            titleTextField.text = todo.title
            isCompleteButton.isSelected = todo.isComplete
            dueDatePickerView.date = todo.dueDate
            notesTextView.text = todo.notes
        } else {
            dueDatePickerView.date = Date().addingTimeInterval(24*60*60)
        } //closes if-let-else
        
        updateDueDateLabel(date: dueDatePickerView.date)
        updateSaveButtonState()
    } //closes viewDidLoad()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let title = titleTextField.text ?? "No Title"
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePickerView.date
        let notes = notesTextView.text
        
        todo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
    } //closes prepare()
    
    func updateDueDateLabel(date: Date) {
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    } //closes updateDueDateLabel()
    
    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    } //closes updateSaveButtonState()
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    } //closes IBAction isCompleteButtonTapped()
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePickerView.date)
    } //closes IBAction datePickerChanged()
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    } //closes IBAction textEditingChanged()
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    } //closes IBAction returnPressed()
} //closes class
