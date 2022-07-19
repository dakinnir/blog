//
//  MainTabBarController.swift
//  InstantBlog
//
//  Created by Daniel Akinniranye on 7/18/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen

        self.setupVCs()
        // Do any additional setup after loading the view.
    }
    
    
    func setupVCs() {
          viewControllers = [
              createNavController(for: BlogsTableViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
              createNavController(for: ProfileViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "gear")!)
          ]
      }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = image
            navController.navigationBar.prefersLargeTitles = true
            rootViewController.navigationItem.title = title
            return navController
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class BlogsTableViewController: UITableViewController {
    
    let blogs = [
        "First Blog Article",
        "Second Blog Article",
        "Third Blog Article",
        "Fourth Blog Article",
        "Fifth Blog Article"
    ]
    
    let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(addBlogButtonClieked))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = barButton
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogs.count + 30
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = blogs[indexPath.row % 5]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Hello"
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100.0
    }
    
    @objc func addBlogButtonClieked() {
        
    }
}

class ProfileViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
