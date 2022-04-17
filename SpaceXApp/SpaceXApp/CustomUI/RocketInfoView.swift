import UIKit

class RocketInfoView: UIView {

    
	private lazy var firstLaunchLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = Constants.nameLabelTextColor
		label.text = "Первый запуск"
		return label
	}()
	
	private lazy var countryLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = Constants.nameLabelTextColor
		label.text = "Страна"
		return label
	}()
	
	private lazy var launchCostLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = Constants.nameLabelTextColor
		label.text = "Стоимость запуска"
		return label
	}()
	
	private lazy var firstLaunchValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = Constants.valueLabelTextColor
		return label
	}()
	
	private lazy var countryValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = Constants.valueLabelTextColor
		label.lineBreakMode = .byTruncatingTail
		return label
	}()
	
	private lazy var launchCostValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = Constants.valueLabelTextColor
		return label
	}()
	
	private lazy var firstLaunchRowView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var countryRowView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var costRowView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	func configurate(launchDate: String, country: String, cost: String) {
		firstLaunchValueLabel.text = launchDate
		countryValueLabel.text = country
		launchCostValueLabel.text = "$\(cost) млн"
		configurateSubviews()
	}
	
	func configurateSubviews() {
		self.addSubview(firstLaunchRowView)
		self.addSubview(countryRowView)
		self.addSubview(costRowView)
		setupFirstLaunchRowView()
		setupCountryRowView()
		setupCostRowView()
	}
	
	private func setupFirstLaunchRowView() {
		firstLaunchRowView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		firstLaunchRowView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
		firstLaunchRowView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
		firstLaunchRowView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3).isActive = true
		firstLaunchRowView.addSubview(firstLaunchLabel)
		firstLaunchRowView.addSubview(firstLaunchValueLabel)
		setupFirstLaunchLabel()
		setupFirstValueLaunchLabel()
	}
	
	private func setupCountryRowView() {
		countryRowView.topAnchor.constraint(equalTo: firstLaunchRowView.bottomAnchor).isActive = true
		countryRowView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
		countryRowView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
		countryRowView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3).isActive = true
		countryRowView.addSubview(countryLabel)
		countryRowView.addSubview(countryValueLabel)
		setupCountryLabel()
		setupCountryValueLabel()
	}
	
	private func setupCostRowView() {
		costRowView.topAnchor.constraint(equalTo: countryRowView.bottomAnchor).isActive = true
		costRowView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
		costRowView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
		costRowView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3).isActive = true
		costRowView.addSubview(launchCostLabel)
		costRowView.addSubview(launchCostValueLabel)
		setupCostLabel()
		setupCostValueLabel()
	}
	
	private func setupFirstLaunchLabel() {
		firstLaunchLabel.leadingAnchor.constraint(equalTo: firstLaunchRowView.leadingAnchor, constant: 10).isActive = true
		firstLaunchLabel.centerYAnchor.constraint(equalTo: firstLaunchRowView.centerYAnchor).isActive = true
	}
	
	private func setupFirstValueLaunchLabel() {
		firstLaunchValueLabel.trailingAnchor.constraint(equalTo: firstLaunchRowView.trailingAnchor, constant: -10).isActive = true
		firstLaunchValueLabel.centerYAnchor.constraint(equalTo: firstLaunchRowView.centerYAnchor).isActive = true
	}
	
	private func setupCountryLabel() {
		countryLabel.leadingAnchor.constraint(equalTo: countryRowView.leadingAnchor, constant: 10).isActive = true
		countryLabel.centerYAnchor.constraint(equalTo: countryRowView.centerYAnchor).isActive = true
	}
	
	private func setupCountryValueLabel() {
		countryValueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: countryLabel.trailingAnchor, constant: 20).isActive = true
		countryValueLabel.trailingAnchor.constraint(equalTo: countryRowView.trailingAnchor, constant: -10).isActive = true
		countryValueLabel.centerYAnchor.constraint(equalTo: countryRowView.centerYAnchor).isActive = true
	}
	
	private func setupCostLabel() {
		launchCostLabel.leadingAnchor.constraint(equalTo: costRowView.leadingAnchor, constant: 10).isActive = true
		launchCostLabel.centerYAnchor.constraint(equalTo: costRowView.centerYAnchor).isActive = true
	}
	
	private func setupCostValueLabel() {
		launchCostValueLabel.trailingAnchor.constraint(equalTo: costRowView.trailingAnchor, constant: -10).isActive = true
		launchCostValueLabel.centerYAnchor.constraint(equalTo: costRowView.centerYAnchor).isActive = true
	}
}
