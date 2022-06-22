//
//  ViewController.swift
//  TestProject
//
//  Created by Andrii Moisol on 22.06.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    let texts = (0..<100).map({ String($0) })

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(TestCell.self, forCellReuseIdentifier: "TestCell")

        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        texts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as? TestCell else { return UITableViewCell() }
        cell.configure(parent: self, text: texts[indexPath.item]) {
            if indexPath.item & 1 == 0 {
                print(self.texts[indexPath.item])
            } else {
                print("ODD")
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

}

