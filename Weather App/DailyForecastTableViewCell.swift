//
//  DailyForecastTableViewCell.swift
//  Weather App
//
//  Created by Gilvan Wemerson on 29/12/23.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {
    
    static let identifier: String = "DailyForecastTableViewCell"
    
    private lazy var weeakDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TER"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let iconCloud = UIImageView()
        iconCloud.image = UIImage(named: "cloudIcon")
        iconCloud.contentMode = .scaleAspectFit
        return iconCloud
    }()
    
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "min 25ºC"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        return label
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "max 25ºC"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12,weight: .semibold)
        return label
    }()
    
    private lazy var temperatureDaysStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weeakDayLabel,
                                                       iconImageView,
                                                       minTemperatureLabel,
                                                       maxTemperatureLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        stackView.spacing = 15
        stackView.axis = .horizontal
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(weekDay: String?, min: String?, max: String?, icon: UIImage?){
        weeakDayLabel.text = weekDay
        minTemperatureLabel.text = "min \(min ?? "")"
        maxTemperatureLabel.text = "max \(max ?? "")"
        iconImageView.image = icon
    }
    
    private func setupView(){
        backgroundColor = .clear
        selectionStyle = .none
        setHierarchy()
        setConstrants()
    }
    
    private func setHierarchy(){
        contentView.addSubview(temperatureDaysStackView)
    }
    
    private func setConstrants(){
        contentView.setConstraintsToParent(temperatureDaysStackView)
        NSLayoutConstraint.activate([
            weeakDayLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 50)            
        ])
    }
}
