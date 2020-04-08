//
//  NowPlayingController.swift
//  TestTask
//
//  Created by Javelink on 4/8/20.
//  Copyright © 2020 Javelink. All rights reserved.
//

import UIKit

final class NowPlayingController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let presenter = NowPlayingPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetch()
        tableView.reloadData()
        setupTableView()
        setupDelegates()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Private Methods
    private func setupTableView() {
        let nib = UINib(nibName: "MovieViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "movieCell")
        tableView.rowHeight = 150
    }

    private func setupDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension NowPlayingController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.filmsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieViewCell else {
            fatalError("Error: no such cell")
        }
        
        cell.setupDataMoviewCell(presenter.filmData(indexPath.row))
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
