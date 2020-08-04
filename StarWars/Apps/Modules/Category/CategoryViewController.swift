//
//  CategoryViewController.swift
//  StarWars
//
//  Created by Ari Munandar on 04/08/20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

import Bond
import UIKit

class CategoryViewController: UIViewController {
    var viewModel: ICategoryViewModelType!
    var router: ICategoryRouter!

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.output.categoryTitle
        viewModel.input.onViewDidLoad()
        setupBinding()
        setupTableView()
    }

    private func setupBinding() {
        viewModel.output.onSuccessFetchingCategory.bind(to: self) { vc in            
            vc.tableView.reloadData()
        }
    }

    private func setupTableView() {
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.output.categoryData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? CategoryTableViewCell else {
            fatalError("CELL NOT FOUND")
        }

        cell.bindingData(data: viewModel.output.categoryData[indexPath.row])
        return cell
    }
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
