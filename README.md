# Generate Swift Storyboard Constants

This wasn't my idea, nor do I know where the original idea came from, but I've used a similar script for Objective-C projects. So I re-wrote it for Swift. 

Features
--------
* Generates a constants file with Swift nested structs for your storyboard view controller identifiers, segue identifiers and cell reuse identifiers. So when you update or add these to your storyboard and build, it will add them to the constants file. 

Setup
-------------
Included in the source is a demo project that shows you how its integrated:

* Add a run script phase in Build Phases that executes the script. 
* Add one or more storyboards to the input files section of the build phase script
* Add an output file location for where your constants file will reside
* Build your project and then include the generated file inside your project

#### Generated Constants File 
You will get a generated file that looks like this:

 	import UIKit
	
	enum StoryboardSegue: String
	{
		case ToSecondViewController = "ToSecondViewController"
	}
	
	enum StoryboardViewController: String
	{
		case First = "First"
		case Second = "Second"
	
		func instantiate() -> UIViewController?
		{
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			
			return storyboard.instantiateViewControllerWithIdentifier(self.rawValue)
		}
	}
	
	enum StoryboardReuseCell: String
	{
		case ExampleCell = "ExampleCell"
	}
	
	extension UIViewController
	{
		func performSegue(segue: StoryboardSegue, sender: AnyObject? = nil)
		{
			self.performSegueWithIdentifier(segue.rawValue, sender: sender)
		}
	}


#### Usage
You can then use this in your code like so:
	
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
