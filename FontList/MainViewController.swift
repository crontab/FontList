//
//  ViewController.swift
//  FontList
//
//  Created by Hovik Melikyan on 23/02/2022.
//

import UIKit


class MainCell: UITableViewCell {

	@IBOutlet fileprivate var titleLabel: UILabel!
}


class MainViewController: UITableViewController {

	private struct FontFamily {
		let name: String
		let fonts: [UIFont]
	}

	private static let stdSize: CGFloat = 17

	private var items: [FontFamily] = UIFont.familyNames.map {
		FontFamily(name: $0, fonts:
			UIFont.fontNames(forFamilyName: $0).map {
				UIFont(name: $0, size: stdSize)!
			}
		)
	}


	override func viewDidLoad() {
		super.viewDidLoad()
	}


	override func numberOfSections(in tableView: UITableView) -> Int {
		items.count
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		items[section].fonts.count
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		items[section].name
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
		let font = items[indexPath.section].fonts[indexPath.row]
		cell.titleLabel.font = font
		cell.titleLabel.text = font.fontName
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
