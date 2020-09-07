//
//  ViewController.swift
//  FlipDishMenu
//
//  Created by 李祺 on 07/09/2020.
//  Copyright © 2020 FlipDish. All rights reserved.
//

import UIKit

class SectionListViewController: UIViewController {
    private lazy var menuVM: MenuSectionViewModel = {
        return MenuSectionViewModel()
    }()
    private var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(tableView)
        initViewModel()
        setupTableView()
    }
    
    private func initViewModel() {
        menuVM.showAlertClosure = { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.showAlert(alertMessage: self.menuVM.alertMessage ?? "UNKOWN ERROR")
            }
        }
        
        menuVM.reloadTableViewClosure = { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        menuVM.initFetch()
    }
    
    private func showAlert(alertMessage:String) {
        let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setupTableView(){
                tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuSectionCell.self, forCellReuseIdentifier: "menuCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
}

extension SectionListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuVM.getNumberOfCells()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuSectionCell
        cell.menuCellViewModel = menuVM.getCellViewModel(at: indexPath)
        return cell
    }
}

extension SectionListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedSection = menuVM.userPressedCell(at: indexPath)
        if selectedSection.count == 0 { return }
        let vc = DishDetailViewController(menuDetailViewModel: MenuDishViewModel(menuItems: selectedSection))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

