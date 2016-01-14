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
    
}





