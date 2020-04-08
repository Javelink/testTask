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

        DispatchQueue.global(qos: .background).async { [weak self] in

            guard let _ = self else { return }

//            NetworkManager.instance.fetchMovies(.popular)
//            let networkManager = NetworkManager()
////            networkManager.tabBarDelegate = self
//
//            networkManager.fetchMovies(.popular)
//            networkManager.fetchDiscover(.movie)
        }

    }

//    func fetchDiscover(_ endpoint: MovieEndpoint) {
//        APIClient.fetchResponce(endpoint) { (model: Result) in
//            print(model.title)
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        create()
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
//        let titleImages = ["choose", "rules", "results"]

        guard let items = tabBar.items else { return }

        for index in 0..<items.count {
            items[index].title = titles[index]
//            items[index].image = UIImage(named: titleImages[index])?.withRenderingMode(.automatic)
        }
    }
}
