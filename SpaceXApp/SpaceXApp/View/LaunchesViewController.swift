import UIKit

class LaunchesViewController: UIViewController {

	// MARK: - Properties
	
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
		
		launchesTableView.delegate = self
		launchesTableView.dataSource = self
		view.backgroundColor = .black
		view.addSubview(launchesTableView)
		setupLaunchesTableView()
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
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = launchesTableView.dequeueReusableCell(withIdentifier: LaunchesTableViewCell.identifirer, for: indexPath)
		guard let launchCell = cell as? LaunchesTableViewCell else {
			return cell
		}
		if indexPath.row == 1 {
			launchCell.configurate(name: "Aaa", date: "22 февраля, 2020", isSuccess: false)
		} else {
			launchCell.configurate(name: "Aaa", date: "22 февраля, 2020", isSuccess: true)
		}
		return launchCell
	}
}
