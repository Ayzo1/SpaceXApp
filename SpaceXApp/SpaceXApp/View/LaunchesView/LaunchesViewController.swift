import UIKit

class LaunchesViewController: UIViewController, LaunchesViewProtocol {

	// MARK: - Properties
	
	var presenter: LaunchesPresenterProtocol?
	var rocketId: String = ""
	var rocketName: String = ""
	
	private lazy var launchesTableView: UITableView = {
		let tableView = UITableView(frame: CGRect.zero, style: .plain)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.register(LaunchesTableViewCell.self, forCellReuseIdentifier: LaunchesTableViewCell.identifirer)
		tableView.separatorStyle = .none
		tableView.backgroundColor = .black
		return tableView
	}()
	
	// MARK: - Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		presenter = LaunchesPresenter(view: self, rocketId: rocketId)
		navigationItem.title = rocketName
		navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
		launchesTableView.delegate = self
		launchesTableView.dataSource = self
		view.backgroundColor = .black
		view.addSubview(launchesTableView)
		setupLaunchesTableView()
		
    }
	
	// MARK: - LaunchesViewProtocol
	
	func updateValues() {
		DispatchQueue.main.async {
			self.launchesTableView.reloadData()
		}
	}
	
	// MARK: - Private methods
	
	private func setupLaunchesTableView() {
		launchesTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
		launchesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
		launchesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
		launchesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
	}
}

extension LaunchesViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter?.getLaunchesCount() ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = launchesTableView.dequeueReusableCell(withIdentifier: LaunchesTableViewCell.identifirer, for: indexPath)
		guard let launchCell = cell as? LaunchesTableViewCell else {
			return cell
		}
		guard let launchDescription = presenter?.getLaunchDescription(for: indexPath.row) else {
			return launchCell
		}
		launchCell.configurate(
			name: launchDescription.name,
			date: launchDescription.date,
			isSuccess: launchDescription.isSuccess)
		return launchCell
	}
}
