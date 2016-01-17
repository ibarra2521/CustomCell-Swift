//
//  ViewController.swift
//  CustomCell Swift
//
//  Created by Nivardo Ibarra on 10/28/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, WebserviceHelperDelegate {
    @IBOutlet weak var tableView: UITableView!
//    var personArray: [Person] = [Person]()
    var movies = Array<Movie>();
    let connection = WebserviceHelper();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.setUpPerson()
        self.connection.delegate = self;
        self.connection.loadDataFromWebService();

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUpPerson() {
/*        let person1 = Person(name: "Anna", number: 60, imageName: "img1.png")
        let person2 = Person(name: "Joe", number: 82, imageName: "img2.png")
        let person3 = Person(name: "Nilo", number: 92, imageName: "img1.png")
        let person4 = Person(name: "Poul", number: 92, imageName: "img1.png")
        personArray.append(person1)
        personArray.append(person2)
        personArray.append(person3)
        personArray.append(person4)*/
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:CustomCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomCell
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.purpleColor()
        }else {
            cell.backgroundColor = UIColor.orangeColor()
        }
        let movie = movies[indexPath.row]
//        cell.setCell(movie.title!, lblRightInt: movie.synopsis!, imageName: movie.imageUrl!)
        cell.setCell(movie.title!, lblRightInt: movie.synopsis!, imageName: "img1")
        
        return cell
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            movies.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
    
/*    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let person = movies[indexPath.row]
        let detailViewController: DetailViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        detailViewController.name = person.name
        detailViewController.age = person.number
        detailViewController.detailImageViewName = person.imageName
        
        self.presentViewController(detailViewController, animated: true, completion: nil)
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    } */
    
    // WebserviceHelperDelegate
    func webserviceHelper(webserviceHelper: WebserviceHelper, didDownloadMovie movieItem: Movie) {
        self.movies.append(movieItem);
        self.tableView.reloadData();
    }

}

