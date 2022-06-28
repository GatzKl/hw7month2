//
//  ViewController.swift
//  hw7month2
//
//  Created by Александр Калашников on 28/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var personTablwView: UITableView!
    
    var addButton = UIButton()
    
    var persons: [PersonModel] = [
        PersonModel(name: "Kuban", image: UIImage(named: "1")!, age: 25, height: 168),
        PersonModel(name: "Aidar", image: UIImage(named: "2")!, age: 23, height: 165),
        PersonModel(name: "Nursultan", image: UIImage(named: "3")!, age: 27, height: 179),
        PersonModel(name: "Sasha", image: UIImage(named: "1")!, age: 17, height: 193),
        PersonModel(name: "Sevara", image: UIImage(named: "2")!, age: 19, height: 160),
        PersonModel(name: "Meder", image: UIImage(named: "3")!, age: 29, height: 178),
        PersonModel(name: "Mirdin", image: UIImage(named: "1")!, age: 22, height: 173),
        PersonModel(name: "Azamat", image: UIImage(named: "2")!, age: 32, height: 155),
        PersonModel(name: "Orozbek", image: UIImage(named: "3")!, age: 48, height: 142),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personTablwView.dataSource = self
        personTablwView.delegate = self
        
        addButton.backgroundColor = .blue
        addButton.setTitle("+", for: .normal)
        addButton.layer.cornerRadius = 100/2
        addButton.addTarget(self, action: #selector(addPerson), for: .touchUpInside)
        
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func addPerson() {
        persons.insert(PersonModel(name: "New Person", image: UIImage(systemName: "person")!, age: 0, height: 0 ), at: 0)
        personTablwView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonCell
        cell.personNameView.text = persons[indexPath.row].name
        cell.personImageView.image = persons[indexPath.row].image
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        navigationController?.pushViewController(secondVC, animated: true)
        
        secondVC.dataName = persons[indexPath.row].name
        secondVC.dataImage = persons[indexPath.row].image
        secondVC.dataHeight = persons[indexPath.row].height
        secondVC.dataAge = persons[indexPath.row].age
    }
}
