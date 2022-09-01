//
//  MoviesTableViewCell.swift
//  MoviesApp
//
//  Created by David Khachidze on 31.08.2022.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    var moviesLabel = UILabel()
    
    
    func createMoviesCell(movieNameYear: MoviesModel) {
        
        moviesLabel.textColor = .black
        moviesLabel.backgroundColor = .clear
        moviesLabel.font = UIFont.systemFont(ofSize: 10)
        moviesLabel.textAlignment = .left
        moviesLabel.text = "\(movieNameYear.name) \(movieNameYear.year)"
        addSubview(moviesLabel)
        moviesLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
    }
}
