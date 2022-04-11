import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
	
	private lazy var roundedView: UIView = {
		let view = UIView()
		view.layer.cornerRadius = 32
		view.backgroundColor = #colorLiteral(red: 0.1058690324, green: 0.1058908626, blue: 0.105864279, alpha: 1)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.contentMode = .scaleToFill
		return view
	}()
	
	private lazy var valueLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.boldSystemFont(ofSize: 15)
		label.textColor = .white
		label.textAlignment = .center
		//label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 1
		return label
	}()
	
	private lazy var keyLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 12)
		label.textColor = .gray
		label.textAlignment = .center
		return label
	}()
	
	func configurateCell(value: String, key: String) {
		valueLabel.text = "\(value)"
		keyLabel.text = key
		configurateSubviews()
	}
	
	private func configurateSubviews() {
		contentView.addSubview(roundedView)
		roundedView.addSubview(keyLabel)
		roundedView.addSubview(valueLabel)
		setupRoundedView()
		setupValueLabel()
		setupKeyLabel()
	}
	
	private func setupValueLabel() {
		valueLabel.bottomAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 0).isActive = true
		valueLabel.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor).isActive = true
		//valueLabel.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 5).isActive = true
		//valueLabel.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 5).isActive = true
		//valueLabel.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: 5).isActive = true
		
	}
	
	private func setupKeyLabel() {
		keyLabel.topAnchor.constraint(equalTo: roundedView.centerYAnchor, constant: 0).isActive = true
		keyLabel.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 10).isActive = true
		keyLabel.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -10).isActive = true
	}
	
	private func setupRoundedView() {
		roundedView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
		roundedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
		roundedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
		roundedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
