//
//  IngredientsTableViewCell.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 21/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class IngredientsTableViewCell: DisposableTableViewCell, ClassIdentifiable, NibIdentifiable {
    typealias CellSectionModel = SectionModel<String, Ingredient>
    
    @IBOutlet weak var collectionView: UICollectionView!

    var viewModel: IngredientsCellViewModel!
    var dataSource: RxCollectionViewSectionedReloadDataSource<CellSectionModel>!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        registerCell()
        setupDataSource()
    }
    
    private func registerCell() {
        collectionView.register(cellType: IngredientCollectionViewCell.self)
    }
    
    private func setupDataSource() {
        dataSource = RxCollectionViewSectionedReloadDataSource<CellSectionModel>(
            configureCell: configureCell
        )
    }
}

extension IngredientsTableViewCell: BindableType {
    func bindViewModel() {
        bindDataSource()
        
        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    private func bindDataSource() {
        viewModel.dataSource.asDriver()
            .map { [CellSectionModel(model: "", items: $0)] }
            .drive(collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

// MARK: Data Source Configuration

extension IngredientsTableViewCell {
    private var configureCell: RxCollectionViewSectionedReloadDataSource<CellSectionModel>.ConfigureCell {
        return { _, collectionView, indexPath, ingredient in
            var cell: IngredientCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            cell.bind(to: IngredientCellViewModel(withData: ingredient.image))
            return cell
        }
    }
}

extension IngredientsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        return .zero
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        return 12.0
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumInteritemSpacingForSectionAt _: Int) -> CGFloat {
        return 12.0
    }
}
