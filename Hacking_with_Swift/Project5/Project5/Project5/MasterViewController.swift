//
//  MasterViewController.swift
//  Project5
//
//  Created by Daniel Freeman on 11/07/2016.
//  Copyright © 2016 Daniel Freeman. All rights reserved.
//

import UIKit
import GameKit

class MasterViewController: UITableViewController {

    
    var objects = [String]()
    var allWords = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(promptForAnswer))
        
        
        if let startWordsPath = NSBundle.mainBundle().pathForResource("start", ofType: "txt"){
            if let startWords = try? String(contentsOfFile: startWordsPath){
                allWords = startWords.componentsSeparatedByString("\n")
            }else{
                loadDefaultWords()
            }
        }else{
            loadDefaultWords()
        }
        
        startGame()
    }
    
    func loadDefaultWords(){
        allWords = ["silkworm", "catdog"]
    }
    
    
    func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .Alert)
        ac.addTextFieldWithConfigurationHandler(nil)
        
        let submitAction = UIAlertAction(title: "Submit", style: .Default) { [unowned self, ac] (action: UIAlertAction!) in
            let answer = ac.textFields![0]
            self.submitAnswer(answer.text!)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: {
            _ in
            print("Cancel Button Pressed")
        })
        
        ac.addAction(submitAction)
        ac.addAction(cancelAction)
        
        
        presentViewController(ac, animated: true, completion: nil)
    }

    func submitAnswer(answer: String) {
        let lowerAnswer = answer.lowercaseString
        
        if wordIsPossible(lowerAnswer) {
            if wordIsOriginal(lowerAnswer) {
                if wordIsReal(lowerAnswer) {
                    if !wordIsWord(lowerAnswer){
                        
                    
                        objects.insert(answer, atIndex: 0)
                        
                        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
                        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                        
                        return
                    }else{
                        showErrorMessage("Be Creative", message: "Can't use the given word as an answer")
                    }
                    
                } else {
                    showErrorMessage("Word not recognised", message: "You can't just make them up, you know!")
                }
            } else {
                showErrorMessage("Word used already", message: "Be more original!")
            }
        } else {
            showErrorMessage("Word not possible", message: "You can't spell that word from '\(title!.lowercaseString)'!")
        }
    }
    
    
    func wordIsPossible(word: String) -> Bool {
        var tempWord = title!.lowercaseString
        
        for letter in word.characters {
            if let pos = tempWord.rangeOfString(String(letter)) {
                tempWord.removeAtIndex(pos.startIndex)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func wordIsOriginal(word: String) -> Bool {
        return !objects.contains(word)
    }
    
    func wordIsReal(word: String) -> Bool {
        if (word.characters.count > 2){
            let checker = UITextChecker()
            let range = NSMakeRange(0, word.characters.count)
            let misspelledRange = checker.rangeOfMisspelledWordInString(word, range: range, startingAt: 0, wrap: false, language: "en")
            
            return misspelledRange.location == NSNotFound
        }else{
            return false
        }
    }
    
    func wordIsWord(word: String) -> Bool{
        if word == title!.lowercaseString{
            return true
        }
        else{
            return false
        }
    }
    
    func showErrorMessage(title: String, message: String){
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(ac, animated: true, completion: nil)
    }
    
    func startGame() {
        allWords = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(allWords) as! [String]
        title = allWords[0]
        objects.removeAll(keepCapacity: true)
        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    // MARK: - Segues

    
    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object
        return cell
    }

    

    


}

