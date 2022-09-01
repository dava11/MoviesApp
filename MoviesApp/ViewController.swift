//
//  ViewController.swift
//  MoviesApp
//
//  Created by David Khachidze on 31.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var moviesArray: [MoviesModel] = [] {
        didSet{
      
             let indexPath = IndexPath(row: moviesArray.count - 1, section: 0)
            moviesTableView.insertRows(at: [indexPath], with: .none)

        }
    }
    var titleMovieTextField = UITextField()
    var yearMovieTextField = UITextField()
    var addButton = UIButton()
    var moviesTableView = UITableView()
    let identifire = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createMainSpase()
        createMoviesTableView()
        
    }
    
    func createMainSpase() {
        
        titleMovieTextField.placeholder = "Title"
        titleMovieTextField.borderStyle = .roundedRect
        view.addSubview(titleMovieTextField)
        titleMovieTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalToSuperview()
        }
        
        yearMovieTextField.placeholder = "Year"
        yearMovieTextField.borderStyle = .roundedRect
        view.addSubview(yearMovieTextField)
        yearMovieTextField.snp.makeConstraints { make in
            make.top.equalTo(titleMovieTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
        }
        
        addButton.backgroundColor = .blue
        addButton.layer.cornerRadius = 10
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(self, action: #selector(addButtonIsPressed), for: .touchUpInside)
        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.top.equalTo(yearMovieTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
    }
    
    func createMoviesTableView() {
        
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        moviesTableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: identifire)
        view.addSubview(moviesTableView)
        moviesTableView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.leading.trailing.equalToSuperview().inset(0)
            make.top.equalTo(addButton.snp.bottom).offset(30)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = moviesTableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as? MoviesTableViewCell else { return UITableViewCell() }
        
        let row = moviesArray[indexPath.row]
        cell.createMoviesCell(movieNameYear: row)
        
        return cell
    }
    
    
    @objc func addButtonIsPressed() {
 
        
        
        guard let title = titleMovieTextField.text, let year = Int(yearMovieTextField.text ?? "") else { return }
        let newMovies = MoviesModel(name: title, year: year)
        for i in moviesArray {
            if i == newMovies {
                return
            }
        }
        moviesArray.append(newMovies)
    }
}


