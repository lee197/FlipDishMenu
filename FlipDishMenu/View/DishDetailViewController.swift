//
//  DishViewController.swift
//  FlipDishMenu
//
//  Created by 李祺 on 07/09/2020.
//  Copyright © 2020 FlipDish. All rights reserved.
//

import UIKit

class DishDetailViewController: UIViewController {
    
    let menuDetailViewModel: MenuDishViewModel
    private weak var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableView.topAnchor),
            self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            self.view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            self.view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
        ])
        self.tableView = tableView
    }
    
    init(menuDetailViewModel: MenuDishViewModel) {
        self.menuDetailViewModel = menuDetailViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setDishDetailView()
    }
    
    func setDishDetailView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DishDetailCell.self, forCellReuseIdentifier: "detailCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
}

extension DishDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuDetailViewModel.getNumberOfCells()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DishDetailCell
        cell.dish = menuDetailViewModel.getDishCellViewModel(at:indexPath.row)
        return cell
    }
}

extension DishDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedDish = menuDetailViewModel.userPressCell(at: indexPath.row)
        if selectedDish.count == 0 { return }
        let vc = ItemOptionViewController(optionViewModel: OptionViewModel(optionItems: selectedDish, originPrice: menuDetailViewModel.getOriginPrice(at: indexPath.row)))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
