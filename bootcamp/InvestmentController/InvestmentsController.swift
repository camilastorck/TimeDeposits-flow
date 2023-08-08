//
//  InvestmentsController.swift
//  FixedTerms
//
//  Created by Camila Storck on 14/11/2022.
//

import UIKit

final class InvestmentsController: UIViewController {
    
    private lazy var USDController: UIViewController = USDViewController()
    private lazy var timeDepositsARSController: UIViewController = TimeDepositsARSController()
    private let investmentsView: InvestmentsView = InvestmentsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        addChilds()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureScrollViewFor(control: investmentsView.control)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureChildViews()
    }
    
    override func loadView() {
        view = investmentsView
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        configureScrollViewFor(control: sender)
    }
}

private extension InvestmentsController {
    
    func configureView() {
        title = "Investments.Title".localized
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: .none)
        self.navigationItem.leftBarButtonItem?.tintColor = .gray
        investmentsView.control.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
    }
    
    func addChilds() {
        addChild(USDController)
        addChild(timeDepositsARSController)
        
        investmentsView.scrollView.addSubview(USDController.view)
        investmentsView.scrollView.addSubview(timeDepositsARSController.view)
        
        USDController.didMove(toParent: self)
        timeDepositsARSController.didMove(toParent: self)
    }
    
    func configureChildViews() {
        let point: CGPoint = CGPoint(x: view.frame.size.width, y: 0)
        investmentsView.scrollView.setContentOffset(point, animated: true)
        USDController.view.frame = CGRect(x: 0,
                                          y: 0,
                                          width: view.frame.size.width,
                                          height: investmentsView.scrollView.frame.size.height)
        timeDepositsARSController.view.frame = CGRect(x: view.frame.size.width,
                                                      y: 0,
                                                      width: view.frame.size.width,
                                                      height: investmentsView.scrollView.frame.size.height)
    }
    
    func configureScrollViewFor(control: UISegmentedControl) {
        let point: CGPoint = CGPoint(x: view.frame.size.width, y: 0)
        if control.selectedSegmentIndex == 0 {
            investmentsView.scrollView.setContentOffset(.zero, animated: true)
        } else if control.selectedSegmentIndex == 1 {
            investmentsView.scrollView.setContentOffset(point, animated: true)
        }
    }
}
