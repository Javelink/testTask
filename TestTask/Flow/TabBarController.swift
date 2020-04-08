//
//  TabBarController.swift
//  TestTask
//
//  Created by Javelink on 4/8/20.
//  Copyright © 2020 Javelink. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func loadView() {
        super.loadView()
        DispatchQueue.global(qos: .background).async {
            NetworkManager.instance.fetchMovies(.popular)
            NetworkManager.instance.fetchMovies(.nowPlaying)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        create()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

// MARK: - Methods
private extension TabBarController {

    private func create() {
        viewControllers = navControllers()
        titleTabBar()
    }

    private func viewControllers() -> [UIViewController] {
        let popular = PopularController.loadFromStoryboard(.popular)
        popular.title = "Popular"
        let nowPlaying = NowPlayingController.loadFromStoryboard(.nowPlaying)
        nowPlaying.title = "Now Playing"
        let arrayOfVC: [UIViewController] = [popular, nowPlaying]
        return arrayOfVC
    }

    private func navControllers() -> [UINavigationController] {
        var arrayNavVC: [UINavigationController] = []

        for viewC in viewControllers() {
            let navigationBar = UINavigationController(rootViewController: viewC)
            arrayNavVC.append(navigationBar)
        }

        return arrayNavVC
    }

    private func titleTabBar() {
        let titles = ["Popular", "Now Playing"]
        
        let imageF: UIImage = .imageSystem(.film, pointSize: 20)
        let imageT: UIImage = .imageSystem(.folder, pointSize: 20)
        let titleImages = [imageF, imageT]

        guard let items = tabBar.items else { return }

        for index in 0..<items.count {
            items[index].title = titles[index]
            items[index].image = titleImages[index]
        }
    }
}
