//
//  MovieViewCell.swift
//  TestTask
//
//  Created by Javelink on 4/8/20.
//  Copyright © 2020 Javelink. All rights reserved.
//

import UIKit
import SDWebImage

final class MovieViewCell: UITableViewCell {

    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var movieNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieNameLabel.lineBreakMode = .byWordWrapping
        movieNameLabel.numberOfLines = 0
    }

    func setupDataMoviewCell(_ film: Film) {
        movieNameLabel.text = film.title
        posterImageView.sd_setImage(with: URL(string: film.posterPath), completed: nil)
    }
}
