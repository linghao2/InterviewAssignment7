//
//  MoviesTableViewController.swift
//  Assignment7
//
//  Created by LING HAO on 2/12/18.
//  Copyright © 2018 LING HAO. All rights reserved.
//

import UIKit

class MoviesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var movies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
        let urlSession = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = urlSession.dataTask(with: url!) { (dataOrNil, response, error) in
            if (error != nil) {
                print("\(error!)")
            } else {
                if let data = dataOrNil {
                    
                    if let dictArray = try! JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, AnyObject?> {
                        for dict in dictArray["results"] as! [Dictionary<String, AnyObject?>] {
                            let title = dict["title"] as? String
                            let overview = dict["overview"] as? String
                            let poster = dict["poster_path"] as? String
                            self.movies.append(Movie.init(title: title, overview: overview, posterPath: poster))
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    */

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MoviesTableViewCell

        cell.movie = movies[indexPath.row]
        cell.selectionStyle = .none

        return cell
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
