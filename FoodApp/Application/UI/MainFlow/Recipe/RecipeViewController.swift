//
//  RecipeViewController.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 20/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import RxCocoa
import RxDataSources
import RxSwift
import UIKit

class RecipeViewController: DisposableViewController {
    typealias DataSource = RxTableViewSectionedReloadDataSource<RecipeSectionModel>
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: DataSource!
    var viewModel: RecipeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        
        registerCell()
        setupDataSource()
    }
    
    
    private func registerCell() {
        tableView.register(cellType: ImageTableViewCell.self)
        tableView.register(cellType: AboutTableViewCell.self)
        tableView.register(cellType: IngredientsTableViewCell.self)
    }
    
    private func setupDataSource() {
        dataSource = DataSource(configureCell: configureCell)
    }
}

extension RecipeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 260
        case 1,2:
            return 40
        case 3:
            return 120
        default:
            return 0
        }
    }
}

extension RecipeViewController: BindableType {
    func bindViewModel() {
        bindDataSource()
        bindSectionModels()
        
        tableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        viewModel.dataSource.map { $0.name }
            .drive(self.rx.title)
            .disposed(by: disposeBag)
    }
    
    private func bindDataSource() {
        viewModel.dataSource
            .drive(onNext: { [unowned self] recipe in self.viewModel.initSectionModels(withRecipe: recipe) })
            .disposed(by: disposeBag)
    }
    
    private func bindSectionModels() {
        viewModel.sectionModels
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

// MARK: Data Source Configuration

extension RecipeViewController {
    private var configureCell: DataSource.ConfigureCell {
        return { dataSource, tableView, indexPath, _ in
            switch dataSource[indexPath] {
            case .image(let imageData):
                var cell: ImageTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
                cell.bind(to: ImageCellViewModel(withData: imageData))
                return cell
            case .about(let text):
                var cell: AboutTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
                cell.bind(to: AboutCellViewModel(withText: text))
                return cell
            case .ingredients(let ingredients):
                var cell: IngredientsTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
                cell.bind(to: IngredientsCellViewModel(withIngredients: ingredients))
                return cell
            }
        }
    }
}
