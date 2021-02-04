//
//  MainViewController.swift
//  internshipAvito
//
//  Created by Влад Барченков on 22.01.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    private var closeButton = CloseButton()
    private var titleLabel = TitleLabel()
    private var promotionCollectionView: UICollectionView!
    private var selectButton = SelectButton()
    
    var dataFetcherService = DataFetcherService()
    var list: [List]?
    var currentPromotion: String?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupCollectionView()
        setupConstraint()
        selectButton.addTarget(self, action: #selector(tapSelectButton), for: .touchUpInside)
        
        
        dataFetcherService.fetchLocalResult { (model) in
            self.titleLabel.text = model?.result.title
            self.list = model?.result.list
        }
    }
    
    // MARK: - Action
    @objc func tapSelectButton() {
        guard let message = currentPromotion else { return showAlert(with: "Услуга не выбрана", and: "Продолжить без изменений?") }
        showAlert(with: "Выбрана услуга", and: message)
    }
    
    // MARK: - Setup CollectionView
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 10.0
        layout.minimumLineSpacing = 10.0
        promotionCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
                promotionCollectionView.showsVerticalScrollIndicator = false
        promotionCollectionView.register(PromotionCollectionViewCell.self, forCellWithReuseIdentifier: PromotionCollectionViewCell.reuseId)
        promotionCollectionView.translatesAutoresizingMaskIntoConstraints = false
        promotionCollectionView.backgroundColor = .clear
        promotionCollectionView.dataSource = self
        promotionCollectionView.delegate = self
    }
  
    // MARK: - Setup Constraint
    private func setupConstraint() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(closeButton)
        view.addSubview(titleLabel)
        view.addSubview(promotionCollectionView)
        view.addSubview(selectButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 15),
            closeButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            promotionCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            promotionCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            promotionCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            promotionCollectionView.bottomAnchor.constraint(equalTo: selectButton.topAnchor, constant: -20)
        ])
        
        
        NSLayoutConstraint.activate([
            selectButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            selectButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            selectButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
            selectButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let list = list else { return 0 }
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionCollectionViewCell.reuseId, for: indexPath) as? PromotionCollectionViewCell,
              let list = list?[indexPath.row]
        else { return PromotionCollectionViewCell() }
        cell.setupCell(list: list)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PromotionCollectionViewCell, let title = cell.titleLabel.text else { return }
        cell.checkmarkImage.isHidden = (cell.checkmarkImage.isHidden == false) ? true : false
        currentPromotion = (currentPromotion == title) ? nil : title
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PromotionCollectionViewCell else { return }
        cell.checkmarkImage.isHidden = true
    }
}
