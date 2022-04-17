import UIKit

class LaunchesTableViewCell: UITableViewCell {
	
	static let identifirer = String(describing: LaunchesTableViewCell.self)

	private lazy var launcCellView: UIView = {
		let view = UIView()
		
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = Constants.cellBackgroundColor
		view.layer.cornerRadius = 30
		return view
	}()
	
	private lazy var nameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = Constants.generalTextColor
		label.lineBreakMode = .byTruncatingTail
		label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
		return label
	}()
	
	private lazy var dateLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = Constants.nameLabelTextColor
		label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
		return label
	}()
	
	private lazy var launchIconImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	func configurate(name: String, date: String, isSuccess: Bool) {
		if isSuccess {
			launchIconImageView.image = UIImage(named: "successLaunch")
		} else {
			launchIconImageView.image = UIImage(named: "failedLaunch")
		}
		
		contentView.backgroundColor = .black
		nameLabel.text = name
		dateLabel.text = date
		contentView.addSubview(launcCellView)
		setupLaunchCellView()
		launcCellView.addSubview(launchIconImageView)
		setupIconViewLabel()
		launcCellView.addSubview(nameLabel)
		setupNameLabel()
		launcCellView.addSubview(dateLabel)
		setupDateLabel()
	}
	
	private func setupLaunchCellView() {
		launcCellView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 5).isActive = true
		launcCellView.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -5).isActive = true
		launcCellView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
		launcCellView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
		launcCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
		launcCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
		launcCellView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
	}
	
	private func setupNameLabel() {
		nameLabel.trailingAnchor.constraint(equalTo: launchIconImageView.leadingAnchor, constant: -20).isActive = true
		nameLabel.topAnchor.constraint(greaterThanOrEqualTo: launcCellView.topAnchor).isActive = true
		nameLabel.bottomAnchor.constraint(equalTo: launcCellView.centerYAnchor, constant: -2).isActive = true
		nameLabel.leadingAnchor.constraint(equalTo: launcCellView.leadingAnchor, constant: 20).isActive = true
	}
	
	private func setupDateLabel() {
		dateLabel.bottomAnchor.constraint(lessThanOrEqualTo: launcCellView.bottomAnchor, constant: -10).isActive = true
		dateLabel.topAnchor.constraint(equalTo: launcCellView.centerYAnchor, constant: 2).isActive = true
		dateLabel.leadingAnchor.constraint(equalTo: launcCellView.leadingAnchor, constant: 20).isActive = true
	}
	
	private func setupIconViewLabel() {
		launchIconImageView.centerYAnchor.constraint(equalTo: launcCellView.centerYAnchor).isActive = true
		launchIconImageView.trailingAnchor.constraint(equalTo: launcCellView.trailingAnchor, constant: -30).isActive = true
		launchIconImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
		launchIconImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
	}
}
