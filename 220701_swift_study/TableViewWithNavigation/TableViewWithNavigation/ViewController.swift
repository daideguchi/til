//
//  ViewController.swift
//  TableViewWithNavigation
//
//  Created by dai deguchi on 2022/06/05.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let animals = ["Dog 🐶", "Cat 😸", "Panda 🐼", "Lion 🦁", "Snake 🐍"]
    
    @IBOutlet var animalTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animalTableView.dataSource = self
        animalTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController,let indexPath = sender as? IndexPath{
            detailVC.message = animals[indexPath.row]
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath)
        
        let label = cell.viewWithTag(1) as? UILabel
        label?.text = animals[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MainToDetail", sender: indexPath)
    }

}

