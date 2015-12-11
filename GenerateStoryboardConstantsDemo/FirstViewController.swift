//
//  ViewController.swift
//  GenerateStoryboardConstantsDemo
//
//  Created by David Casserly on 10/11/2015.
//  Copyright © 2015 DevedUp Ltd. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func exampleButtonAction() {
        let viewController = StoryboardViewController.Second.instantiate()
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier(StoryboardReuseCell.ExampleCell.rawValue, forIndexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegue(StoryboardSegue.ToSecondViewController)
    }

}

