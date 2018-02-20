# VisColl in a Box

VisColl in a Box is a set of Vagrant scripts that set up portable VirtualBox images for University of Toronto's *VisColl* collation program. These images can be used to easily create collation diagrams, set up mobile workshops, or evaluate the program risk-free.

## Bundled Software

PRE-RELEASE ALERT: Due to unreleased content, some of these bundled dependencies must be pre-downloaded before setting up.

- VisColl (clone into `ViscollObns`)

## System Requirements

- Windows 7 or higher / Mac OS X El Capitan or higher / Ubuntu 14.04 LTS or higher
- At least 4GB available hard drive space
- 4GB RAM total or more, at least 2GB available
- VirtualBox 5.1.30+ or 5.2.6+ or above (link)
- Vagrant 2.0.2 or above (link)
	- (Windows only) WMF 4.0 or above

Note: If you do not already have VirtualBox and Vagrant installed, please install VirtualBox first and Vagrant second.

## Installation

- Clone this repository or download its zip file.
- Double-click the start file for your system (`start.bat` for Windows, `start.command` for Mac OS X, `start.sh` for Ubuntu).
- Allow up several minutes for box dependencies to download and set up.

If installation is successful, a browser window should appear showing Viscoll. 

*Command Line Usage: You can also start VisColl in a Box using `vagrant up`. When it is done setting up, allow it about 5-10 seconds to compile, then simply browse to `http://127.0.0.1:3000`.*

## Usage

To begin, simply run `start.bat` for Windows, `start.command` for Mac OS X, or `start.sh` for Ubuntu. The box should start up within a minute. When it is done starting up, a browser window should appear showing Viscoll at `http://localhost:3000`. The default login credentials are `user@viscoll.com / goviscoll`. If you sign up additional users, you must visit `http://localhost:1080` to access the simulated confirmation email required for activating their accounts.

To end, simply run `stop.bat` for Windows, `stop.command` for Mac OS X, or `stop.sh` for Ubuntu.

*Command Line Usage: You can also start VisColl in a Box using `vagrant up` and shut it down using `vagrant halt`.*

## Uninstallation

Run `uninstall.bat` if you use Windows, `uninstall.command` if you use Mac OS X or `uninstall.sh` if you use Ubuntu. This will remove the VirtualBox image generated during installation.

*Command Line Usage: You can uninstall VisColl in a Box using `vagrant destroy`.*

## License

VisColl in a Box is licensed under Apache License 2.0.
