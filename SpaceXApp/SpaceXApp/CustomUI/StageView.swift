import UIKit

class StageView: UIView {
	
	// MARK: - Properties
	
	private lazy var headerLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.textColor = Constants.generalTextColor
		return label
	}()
		
	private lazy var enginesLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = Constants.nameLabelTextColor
		label.text = "Количество двигателей"
		return label
	}()
	
	private lazy var massOfFuelLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = Constants.nameLabelTextColor
		label.text = "Количество топлива"
		return label
	}()
	
	private lazy var burnTimeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = Constants.nameLabelTextColor
		label.text = "Время сгорания"
		return label
	}()
	
	private lazy var tonsLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = Constants.nameLabelTextColor
		label.text = "ton"
		return label
	}()
	
	private lazy var secLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = Constants.nameLabelTextColor
		label.text = "sec"
		return label
	}()
	
	private lazy var enginesValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.textColor = Constants.valueLabelTextColor
		return label
	}()
	
	private lazy var massOfFuelValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.textColor = Constants.valueLabelTextColor
		return label
	}()
	
	private lazy var burnTimeValueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.boldSystemFont(ofSize: 16)
		label.textColor = Constants.valueLabelTextColor
		return label
	}()
	
	private lazy var headerRowView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var enginesRowView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var massFuelRowView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var burnFuelRowView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	// MARK: - Public methods
	
	func configurate(header: String, enginesCount: String, fuelMass: String, burnTime: String) {
		headerLabel.text = header
		enginesValueLabel.text = enginesCount
		massOfFuelValueLabel.text = fuelMass
		burnTimeValueLabel.text = burnTime
		
		self.addSubview(headerRowView)
		self.addSubview(enginesRowView)
		self.addSubview(massFuelRowView)
		self.addSubview(burnFuelRowView)
		setupHeaderRowView()
		setupEnginesRowView()
		setupMassFuelRowView()
		setupBurnFuelRowView()
		
	}
	
	// MARK: - Private methods
	
	private func setupHeaderRowView() {
		headerRowView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		headerRowView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
		headerRowView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
		headerRowView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/4).isActive = true
		headerRowView.addSubview(headerLabel)
		setupHeaderLabel()
	}
	
	private func setupEnginesRowView() {
		enginesRowView.topAnchor.constraint(equalTo: headerRowView.bottomAnchor).isActive = true
		enginesRowView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
		enginesRowView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
		enginesRowView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/4).isActive = true
		enginesRowView.addSubview(enginesLabel)
		enginesRowView.addSubview(enginesValueLabel)
		setupEnginesLabel()
		setupEnginesValueLabel()
	}
	
	private func setupMassFuelRowView() {
		massFuelRowView.topAnchor.constraint(equalTo: enginesRowView.bottomAnchor).isActive = true
		massFuelRowView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
		massFuelRowView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
		massFuelRowView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/4).isActive = true
		massFuelRowView.addSubview(massOfFuelLabel)
		massFuelRowView.addSubview(massOfFuelValueLabel)
		massFuelRowView.addSubview(tonsLabel)
		setupMassOfFuelLabel()
		setupMassOfFuelValueLabel()
		setupTonsLabel()
	}
	
	private func setupBurnFuelRowView() {
		burnFuelRowView.topAnchor.constraint(equalTo: massFuelRowView.bottomAnchor).isActive = true
		burnFuelRowView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
		burnFuelRowView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
		burnFuelRowView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/4).isActive = true
		burnFuelRowView.addSubview(burnTimeLabel)
		burnFuelRowView.addSubview(burnTimeValueLabel)
		burnFuelRowView.addSubview(secLabel)
		setupBurnTimeLabel()
		setupBurnTimeValueLabel()
		setupSecLabel()
	}
	
	private func setupHeaderLabel() {
		headerLabel.leadingAnchor.constraint(equalTo: headerRowView.leadingAnchor, constant: 10).isActive = true
		headerLabel.trailingAnchor.constraint(greaterThanOrEqualTo: headerRowView.trailingAnchor, constant: 10).isActive = true
		headerLabel.centerYAnchor.constraint(equalTo: headerRowView.centerYAnchor).isActive = true
	}
	
	private func setupEnginesLabel() {
		enginesLabel.leadingAnchor.constraint(equalTo: enginesRowView.leadingAnchor, constant: 10).isActive = true
		// enginesLabel.trailingAnchor.constraint(greaterThanOrEqualTo: enginesValueLabel.leadingAnchor, constant: 10).isActive = true
		enginesLabel.centerYAnchor.constraint(equalTo: enginesRowView.centerYAnchor).isActive = true
	}
	
	private func setupMassOfFuelLabel() {
		massOfFuelLabel.leadingAnchor.constraint(equalTo: massFuelRowView.leadingAnchor, constant: 10).isActive = true
		massOfFuelLabel.centerYAnchor.constraint(equalTo: massFuelRowView.centerYAnchor).isActive = true
	}
	
	private func setupBurnTimeLabel() {
		burnTimeLabel.leadingAnchor.constraint(equalTo: burnFuelRowView.leadingAnchor, constant: 10).isActive = true
		burnTimeLabel.centerYAnchor.constraint(equalTo: burnFuelRowView.centerYAnchor).isActive = true
	}
	
	private func setupTonsLabel() {
		tonsLabel.trailingAnchor.constraint(equalTo: massFuelRowView.trailingAnchor, constant: -10).isActive = true
		tonsLabel.centerYAnchor.constraint(equalTo: massFuelRowView.centerYAnchor).isActive = true
	}
	
	private func setupSecLabel() {
		secLabel.trailingAnchor.constraint(equalTo: burnFuelRowView.trailingAnchor, constant: -10).isActive = true
		secLabel.centerYAnchor.constraint(equalTo: burnFuelRowView.centerYAnchor).isActive = true
	}
	
	private func setupEnginesValueLabel() {
		enginesValueLabel.trailingAnchor.constraint(equalTo: enginesRowView.trailingAnchor, constant: -10).isActive = true
		enginesValueLabel.centerYAnchor.constraint(equalTo: enginesRowView.centerYAnchor).isActive = true
	}
	
	private func setupMassOfFuelValueLabel() {
		massOfFuelValueLabel.trailingAnchor.constraint(equalTo: tonsLabel.leadingAnchor, constant: -5).isActive = true
		massOfFuelValueLabel.centerYAnchor.constraint(equalTo: massFuelRowView.centerYAnchor).isActive = true
	}
	
	private func setupBurnTimeValueLabel() {
		burnTimeValueLabel.trailingAnchor.constraint(equalTo: secLabel.leadingAnchor, constant: -5).isActive = true
		burnTimeValueLabel.centerYAnchor.constraint(equalTo: burnFuelRowView.centerYAnchor).isActive = true
	}
}
