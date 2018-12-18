//
//  RGBYLandingScreen.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/10/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit
import RealmSwift

class RGBYLandingScreenViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var mainViewConstraint: NSLayoutConstraint!

    @IBOutlet weak var lastLoginLabel: UILabel!
    
    // club section
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var teamName: UILabel!

    // upcoming fixtures section
    @IBOutlet weak var fixtureTable: UITableView!

    // next fixture section
    @IBOutlet weak var oppImage: UIImageView!
    @IBOutlet weak var oppLabel: UILabel!
    @IBOutlet weak var oppClubName: UILabel!
    @IBOutlet weak var oppTeamName: UILabel!
    @IBOutlet weak var oppSecDetail: UILabel!
    @IBOutlet weak var oppTerDetail: UITextView!
   
    // squad list section
    @IBOutlet weak var squadListTable: UITableView!
    
    var upcomingFixtureList: [RGBYMatch]?
    var team: RGBYTeam?

    var menuIsVisible: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        print("RGBYLandingScreenViewController:: viewDidLoad");
        // show the initial view
        if let coach = RGBYCoach.get(id: AppDelegate.COACH_ID) {
            self.lastLoginLabel.text = "Coach \(coach.fName) \(coach.lName)\nUpdated Data: \(RGBYUtils.mmmddyyyhhmm().string(from: coach.lastUpdate))"
        }
        if let team = RGBYTeam.get(id: AppDelegate.TEAM_ID) {
            // TODO where does this data come from?
            // setTeamData(team: RGBYDemoData.demoTeam)
            setTeamData(team: team)
            // get fixture list from database?
            let fixtureList = RGBYMatch.upcomingFor(team: team)
            setUpcomingFixtureList(fixtureList: Array(fixtureList))
        }
        self.fixtureTable.dataSource = self
        self.squadListTable.dataSource = self
        self.oppImage.superview!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(presentNextFixture)))
        // set the bounds of the club/team detail
        styleSectionBox(view: self.teamLogo.superview!, borderWidth: 1, cornerRadius: 10)
        styleSectionBox(view: self.teamLogo, borderWidth: 3, cornerRadius: self.teamLogo.frame.height/2)
        styleSectionBox(view: self.fixtureTable.superview!, borderWidth: 1, cornerRadius: 10)
        styleSectionBox(view: self.squadListTable.superview!, borderWidth: 1, cornerRadius: 10)
    }

    func styleSectionBox(view: UIView, borderWidth: CGFloat, cornerRadius: CGFloat) {
        view.layer.borderWidth = borderWidth
        view.layer.masksToBounds = false
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = cornerRadius
        view.clipsToBounds = true
    }

    func setTeamData(team: RGBYTeam) {
        self.team = team
        self.teamLogo.image = RGBYUtils.imageDataOrDefault(imageData: RGBYClub.retrieveImageData(club: team.club!, in: try! Realm()), defaultIcon: "AppIcon");
        self.clubName.text = team.club?.title
        self.teamName.text = team.title
    }

    func setUpcomingFixtureList(fixtureList: [RGBYMatch]) {
        
        // update the upcoming fixture list
        self.upcomingFixtureList = fixtureList
        self.fixtureTable.reloadData()

        // update the next fixure section
        let nextFixture = self.upcomingFixtureList![0]
        if let oppTeam = nextFixture.opposition {
            if let data = RGBYClub.retrieveImageData(club: oppTeam.club!, in: try! Realm()) {
                self.oppImage.image = UIImage(data: data)
                styleSectionBox(view: self.oppImage, borderWidth: 3, cornerRadius: self.oppImage.frame.height/2)
            } else {
                // if no image then set vs / @
                self.oppLabel.text = nextFixture.isHomeMatch ? "vs" : "@"
                 styleSectionBox(view: self.oppLabel, borderWidth: 5, cornerRadius: self.oppLabel.frame.height/2)
                self.oppLabel.isHidden = false
                self.oppImage.isHidden = true
            }
            self.oppClubName.text = (oppTeam.club != nil) ? oppTeam.club!.title : oppTeam.title
            self.oppTeamName.text = oppTeam.title
            self.oppSecDetail.text = RGBYUtils.mmmddyyyhhmm().string(from: nextFixture.date)
            self.oppTerDetail.text = nextFixture.location
            styleSectionBox(view: self.oppTerDetail.superview!, borderWidth: 1, cornerRadius: 10)
        }
    }

    @IBAction func handleMenuButton(_ sender: UIBarButtonItem) {
        if menuIsVisible {
            self.mainViewConstraint.constant = 315
            menuIsVisible = false
        } else {
            self.mainViewConstraint.constant = 5
            menuIsVisible = true
        }
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO this is probably a code smell
        if tableView == self.fixtureTable {
            return (self.upcomingFixtureList?.count)!
        } else if tableView == self.squadListTable {
            return (self.team?.playerList.count)!
        }
        // handle error states
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.fixtureTable {
            // if this is the fixture list
            let cell = tableView.dequeueReusableCell(withIdentifier: "rgbyFixtureCell")! as! RGBYFixtureTableViewCell
            let fixture = self.upcomingFixtureList![indexPath.row]
            styleSectionBox(view: cell.typeLabel, borderWidth: 2, cornerRadius: cell.typeLabel.frame.height/2)
            cell.oppositionLabel.text = fixture.title
            if fixture.isHomeMatch {
                cell.typeLabel.text = "vs"
                cell.secondaryDetailLabel.text = "\(RGBYUtils.mmddyyyhhmm().string(from: fixture.date)) - \(fixture.location )"
            } else {
                cell.typeLabel.text = "@"
                cell.secondaryDetailLabel.text = "\(RGBYUtils.mmddyyyhhmm().string(from: fixture.date)) - \(fixture.location )"
            }
            styleSectionBox(view: cell, borderWidth: 0, cornerRadius: 20)
            cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.lightGray : UIColor.white
            return cell
        } else if tableView == self.squadListTable {
            // if this is the squad list
            let cell = tableView.dequeueReusableCell(withIdentifier: "rgbyTeamSquadListCell") as! RGBYProfileTableViewCell
            if let player = self.team?.playerList[indexPath.row] {
                cell.penImage.image = RGBYUtils.formatPenImage(imageURL: URL(string: player.imageURL))
                styleSectionBox(view: cell.penImage, borderWidth: 2, cornerRadius: cell.penImage.frame.height/2)
                cell.playerNameLabel.text = "\(player.fName) \(player.lName)"
                cell.positionLabel.text = player.preferredPosition.displayName
                styleSectionBox(view: cell, borderWidth: 1, cornerRadius: 10)
            }
            return cell
        }
        return tableView.dequeueReusableCell(withIdentifier: "invalid")!
    }

    // INTERACTION HANDLERS
    @objc func presentNextFixture() {
        performSegue(withIdentifier: "presentMatchDaySelection", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "presentMatchDaySelection" {
            let vc = segue.destination as! RGBYMatchDaySquadSelectionViewController
            vc.setMatchDayData(team: self.team!, match: self.upcomingFixtureList![0])
        }
    }
}

class RGBYProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var penImage: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!

}

class RGBYFixtureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var oppositionLabel: UILabel!
    @IBOutlet weak var secondaryDetailLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
}
