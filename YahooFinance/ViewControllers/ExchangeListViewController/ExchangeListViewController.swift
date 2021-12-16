//
//  ExchangeListViewController.swift
//  YahooFinance
//
//  Created by Sheikh Ali on 10/12/2021.
//

import UIKit
import RxSwift
import RxCocoa

class ExchangeListViewController: UIViewController {

    private let disposeBag = DisposeBag()
    private var viewModel: ExchangesListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    static func instantiate(viewModel: ExchangesListViewModel) -> ExchangeListViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ExchangeListViewController") as! ExchangeListViewController
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindViewModel()
    }
    
    func bindViewModel() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.tableFooterView = UIView()
        
        viewModel.fecthExchangeViewModels()
            .observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "ExchangeListTableViewCell")) { index, viewModel, cell in
            (cell as ExchangeListTableViewCell).setup(viewModel: viewModel)
            }.disposed(by: disposeBag)
        
        tableView.rx.modelAndIndexSelected(ExchangeListTableViewCellViewModel.self).subscribe { [weak self] model, indexPath in
            print(model.exchangeName)
            self?.viewModel.showExchangeDetail()
        }.disposed(by: disposeBag)
    }
}

