//
//  ViewController.swift
//  TestIosApp
//
//  Created by Tudor-Dan Balas on 15.04.2021.
//

import UIKit

class ViewController: UIViewController {
    // list view ; countries + capitals

    private var tableView: UITableView?
    private var countries = [Country]()
    
    private let reuseIdentifier = "reuseIdentifier"
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initView()
        initConstraints()
        fetchData()
    }
    
    // MARK: - Callbacks
    
    private func initView() {
        tableView = UITableView(frame: .zero)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(CountryCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    private func initConstraints() {
        guard let tableView = tableView else { return }
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func fetchData() {
        NetworkManager.instance.fetchCountries(completion: { [weak self] countries in
            DispatchQueue.main.async {
                self?.countries = countries
                self?.tableView?.reloadData()
            }
        }, completionError: { [weak self] _ in
            let alert = UIAlertController(title: "Error", message: "Something is wrong", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self?.show(alert, sender: self)
        })
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CountryCell
        let viewModel = CountryCell.ViewModel(country: countries[indexPath.row])
        cell?.setup(viewModel: viewModel)
        return cell ?? UITableViewCell(frame: .zero)
    }
    
    
}

