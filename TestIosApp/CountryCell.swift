//
//  CountryCell.swift
//  TestIosApp
//
//  Created by Tudor-Dan Balas on 15.04.2021.
//

import Foundation
import UIKit

class CountryCell: UITableViewCell {
    
    private var nameLabel: UILabel?
    private var capitalLabel: UILabel?
    
    struct ViewModel {
        let country: Country
    }
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Callbacks
    
    public func setup(viewModel: ViewModel) {
        nameLabel?.text = viewModel.country.name
        capitalLabel?.text = viewModel.country.capital
    }
    
    private func initView() {
        nameLabel = UILabel(frame: .zero)
        capitalLabel = UILabel(frame: .zero)
    }
    
    private func initConstraints() {
        guard let nameLabel = nameLabel,
              let capitalLabel = capitalLabel
        else { return }
        
        [nameLabel, capitalLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let padding: CGFloat = 8
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: padding),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            capitalLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding),
            capitalLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
}
