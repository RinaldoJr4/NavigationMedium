//
//  ViewController.swift
//  NavigationMedium
//
//  Created by rsbj on 29/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    let secondViewController = SecondViewController()

    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Show 2nd View", for: .normal)
        button.backgroundColor = .blue
        button.frame = CGRect(x: 50, y: 50, width: 200, height: 30)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = CGRect(x: 50, y: 90, width: 200, height: 410)
        tableView.backgroundColor = .systemPink
        tableView.rowHeight = 50
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(button)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }

    @objc func tappedButton(){
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(secondViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.backgroundColor = .purple
        cell.textLabel?.text = "\(indexPath.row + 1)˚ TableViewCell"
        return cell
    }
}

class SecondViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
    }
}


