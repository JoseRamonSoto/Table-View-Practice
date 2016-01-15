//
import UIKit
//be sure to add datasource tableview delegate protocols
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
var superheros = ["Rare Pepe", "Wonderwoman", "Batman", "Flash", "Scruba Steve", "Aquaman"]
var realNames = ["Master N8", "Diana", "Bruce Wayne", "Barry Allen", "Steve", "Arthur Curry"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //setting datasource and delagate
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add Superhero", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let superheroNameTextField = myAlert.textFields![0]
            as UITextField
            let aliasTextField = myAlert.textFields![1] as UITextField
            self.superheros.append(superheroNameTextField.text!)
            self.realNames.append(aliasTextField.text!)
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        
        myAlert.addTextFieldWithConfigurationHandler { (superHeroTextField) -> Void in
            superHeroTextField.placeholder = "Add Superhero Name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (liasTextField) -> Void in
            aliasTextField.placeholder = "Add Real Name"
        //presents the alert view controller
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    //creates a cell that will store data
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = superheros[indexPath.row]
        return myTableViewCell
        myTableViewCell.detailTextLabel?.text = realNames[indexPath.row]
    }
    
    //sets number of rows in table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superheros.count
    }
//Allows you to delete rows from table view
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            superheros.removeAtIndex(indexPath.row)
            realNames.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
}





