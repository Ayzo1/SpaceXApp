import UIKit
import Kingfisher

class RocketsViewController: UIViewController, RocketsViewProtocol {
	
	// MARK: - Properties
	
	override var prefersStatusBarHidden: Bool {
		 return true
	}
	
	var presenter: RocketsPresenterProtocol?
	
	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.isUserInteractionEnabled = true
		scrollView.isScrollEnabled = true
		scrollView.backgroundColor = Constants.backgroundColor
		return scrollView
	}()
	
	private lazy var rocketImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.backgroundColor = .white
		return imageView
	}()
	
	private lazy var headerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = Constants.backgroundColor
		view.layer.cornerRadius = 20
		return view
	}()
	
	private lazy var rocketNameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
		label.textColor = Constants.generalTextColor
		label.text = "Rocket"
		return label
	}()
	
	private lazy var settingsButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.contentVerticalAlignment = .fill
		button.contentHorizontalAlignment = .fill
		button.tintColor = Constants.nameLabelTextColor
		button.setImage(UIImage(systemName: "gearshape"), for: .normal)
		button.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
		return button
	}()
	
	private lazy var collectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
		layout.itemSize = CGSize(width: 100, height: 90)
		layout.scrollDirection = .horizontal
		let collectionView = UICollectionView(frame: CGRect(x: 10, y: 30, width: 0, height: 100), collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		collectionView.backgroundColor = Constants.backgroundColor
		return collectionView
	}()
	
	private lazy var rocketInfoView: RocketInfoView = {
		let view = RocketInfoView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var firstStageView: StageView = {
		let view = StageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var secondStageView: StageView = {
		let view = StageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var launchesButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = Constants.cellBackgroundColor
		button.setTitle("Посмотреть запуски", for: .normal)
		button.tintColor = .white
		button.layer.cornerRadius = 15
		button.addTarget(self, action: #selector(launchesButtonAction), for: .touchUpInside)
		return button
	}()
	
	private lazy var pageControl: UIPageControl = {
		let pageContol = UIPageControl()
		pageContol.numberOfPages = 2
		pageContol.translatesAutoresizingMaskIntoConstraints = false
		pageContol.backgroundColor = Constants.pageControlBackgroundColor
		pageContol.addTarget(self, action: #selector(pageDidChange), for: .valueChanged)
		return pageContol
	}()
	
	// MARK: - Lifecycle

	override func viewDidLoad() {
        super.viewDidLoad()
		presenter = RocketsPresenter(view: self)
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		configurateNavigationBar()
		configurateSubviews()
		fillData()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: animated)
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.setNavigationBarHidden(false, animated: animated)
	}
	
	// MARK: - RocketsViewProtocol
	
	func updateValues() {
		DispatchQueue.main.async {
			self.fillData()
			self.collectionView.reloadData()
		}
	}
	
	func reloadCollectionViewCell(indexPaths: [IndexPath]) {
		collectionView.reloadItems(at: indexPaths)
	}
	
	// MARK: - Private methods
	
	private func fillData() {
		guard let pagesCount = presenter?.getPagesCount() else {
			return
		}
		if pagesCount < 1 {
			return
		}
		
		pageControl.numberOfPages = pagesCount
		
		setRocketInfoValues()
		setFirstStageValues()
		setSecondStageValues()
		
		guard let name = presenter?.getRocketName(for: pageControl.currentPage) else {
			return
		}
		rocketNameLabel.text = name
		
		guard let url = presenter?.getImageURL(for: pageControl.currentPage) else {
			return
		}
		
		rocketImageView.kf.setImage(with: url)
	}
	
	private func setSecondStageValues() {
		guard let secondStageInfo = presenter?.getSecondStageInfo(for: pageControl.currentPage) else {
			return
		}
		secondStageView.configurate(
			header: "Вторая ступень",
			enginesCount: secondStageInfo.engiensCount,
			fuelMass: secondStageInfo.massOfFuel,
			burnTime: secondStageInfo.burnTime)
	}
	
	private func setFirstStageValues() {
		guard let firstStageInfo = presenter?.getFirstStageInfo(for: pageControl.currentPage) else {
			return
		}
		firstStageView.configurate(
			header: "Первая ступень",
			enginesCount: firstStageInfo.engiensCount,
			fuelMass: firstStageInfo.massOfFuel,
			burnTime: firstStageInfo.burnTime)
	}
	
	private func setRocketInfoValues() {
		guard let rocketInfo = presenter?.getRocketInfo(for: pageControl.currentPage) else {
			return
		}
		rocketInfoView.configurate(
			launchDate: rocketInfo.firstLaunch,
			country: rocketInfo.country,
			cost: rocketInfo.launchCost)
	}
	
	private func configurateNavigationBar() {
		let backButton = UIBarButtonItem()
		backButton.title = "Назад"
		backButton.tintColor = .white
		navigationController?.navigationBar.barTintColor = .black
		navigationController?.navigationBar.isTranslucent = false
		navigationItem.backBarButtonItem = backButton
	}
	
	private func configurateSubviews() {
		view.addSubview(scrollView)
		setupScrollView()
		scrollView.addSubview(rocketImageView)
		setupRocketImageView()
		scrollView.addSubview(headerView)
		setupHeaderView()
		scrollView.addSubview(collectionView)
		setupCollectionView()
		scrollView.addSubview(rocketInfoView)
		setupRocketInfoView()
		scrollView.addSubview(firstStageView)
		setupFirstStageView()
		scrollView.addSubview(secondStageView)
		setupSecondStageView()
		scrollView.addSubview(launchesButton)
		setupLaunchesButton()

		view.addSubview(pageControl)
		setupPageControl()
	}
	
	private func setupScrollView() {
		scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
	}
	
	private func setupHeaderView() {
		headerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
		headerView.topAnchor.constraint(equalTo: rocketImageView.bottomAnchor, constant: -20).isActive = true
		headerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
		headerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
		headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
		headerView.addSubview(rocketNameLabel)
		setupRocketNameLabel()
		headerView.addSubview(settingsButton)
		setupSettingsButton()
	}
	
	private func setupRocketImageView() {
		rocketImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
		rocketImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -50).isActive = true
		rocketImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
		rocketImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
		rocketImageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1/3).isActive = true
	}
	
	private func setupRocketNameLabel() {
		rocketNameLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
		rocketNameLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 30).isActive = true
		rocketNameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: headerView.trailingAnchor, constant: 20).isActive = true
	}
	
	private func setupSettingsButton() {
		settingsButton.centerYAnchor.constraint(equalTo: rocketNameLabel.centerYAnchor).isActive = true
		settingsButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -30).isActive = true
		settingsButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
		settingsButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
	}
	
	private func setupCollectionView() {
		collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
		collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
	}
	
	private func setupRocketInfoView() {
		rocketInfoView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20).isActive = true
		rocketInfoView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
		rocketInfoView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
		rocketInfoView.heightAnchor.constraint(equalToConstant: 100).isActive = true
	}
	
	private func setupFirstStageView() {
		firstStageView.topAnchor.constraint(equalTo: rocketInfoView.bottomAnchor, constant: 20).isActive = true
		firstStageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
		firstStageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
		firstStageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
	}
	
	private func setupSecondStageView() {
		secondStageView.topAnchor.constraint(equalTo: firstStageView.bottomAnchor, constant: 20).isActive = true
		secondStageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
		secondStageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
		secondStageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
	}
	
	private func setupPageControl() {
		pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		pageControl.heightAnchor.constraint(equalToConstant: 100).isActive = true
		pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
	}
	
	private func setupLaunchesButton() {
		launchesButton.topAnchor.constraint(equalTo: secondStageView.bottomAnchor, constant: 40).isActive = true
		launchesButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
		launchesButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
		launchesButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
		launchesButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
		launchesButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -120).isActive = true
	}
	
	// MARK: - @objc methods
	
	@objc private func settingsButtonTapped() {
		
		let settingsViewContriller = SettingsViewController()
		let settingsNavigationController = UINavigationController(rootViewController: settingsViewContriller)
		self.present(settingsNavigationController, animated: true, completion: nil)
	}
	
	@objc private func pageDidChange() {
		updateValues()
	}
	
	@objc private func launchesButtonAction() {
		let launchesViewController = LaunchesViewController()
		let rocketId = presenter?.getRocketId(for: pageControl.currentPage)
		launchesViewController.rocketId = rocketId ?? ""
		let rocketName = presenter?.getRocketName(for: pageControl.currentPage)
		launchesViewController.rocketName = rocketName ?? ""
		navigationController?.pushViewController(launchesViewController, animated: true)
	}
}

extension RocketsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return presenter?.getCharacteristicsCount() ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
		guard let custom = cell as? CustomCollectionViewCell else {
			return cell
		}
		guard let characteristics = presenter?.getCharacterictics(for: pageControl.currentPage, characteristicIndex: indexPath.row) else {
			return custom
		}
		custom.configurateCell(value: characteristics.value, key: characteristics.name)
		return custom
	}
}
