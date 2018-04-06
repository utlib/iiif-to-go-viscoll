# IIIF to Go (VisColl Version)

IIIF to Go is a set of Vagrant scripts that set up portable VirtualBox images for University of Toronto's *VisColl* collation program. These images can be used to easily create collation diagrams, set up mobile workshops, or evaluate the program risk-free.

## Bundled Software

- [VisColl](https://github.com/utlib/VisualCollation)

## System Requirements

- Windows 7 or higher / Mac OS X El Capitan or higher / Ubuntu 14.04 LTS or higher
- At least 4GB available hard drive space
- 4GB RAM total or more, at least 2GB available
- VirtualBox 5.1.30+ or 5.2.6+ or above ([link](https://www.virtualbox.org/))
- Vagrant 2.0.2 or above ([link](https://www.vagrantup.com))
	- (Windows only) [WMF 4.0](https://www.microsoft.com/en-ca/download/details.aspx?id=40855) or above

Note: If you do not already have VirtualBox and Vagrant installed, please install VirtualBox first and Vagrant second.

## Installation

- If VirtualBox is not installed, [download](https://www.virtualbox.org/wiki/Downloads) and install it.
	- In the installer's "Custom Setup" step, ensure that "VirtualBox Networking" is set to be installed. 
	- Restart your system after the installer finishes.
- If Vagrant is not installed, [download](https://www.vagrantup.com/downloads.html) and install it.
- Clone this repository or download its zip file.
- Double-click the start file for your system (`start.bat` for Windows, `start.command` for Mac OS X, `start.sh` for Ubuntu).
- Allow up several minutes for box dependencies to download and set up.

If installation is successful, a browser window should appear showing Viscoll. 

*Command Line Usage: You can also start IIIF to Go using `vagrant up`. When it is done setting up, allow it about 5-10 seconds to compile, then simply browse to `http://127.0.0.1:3000`. If you wish to see diagnostic output while the box is starting up, run `vagrant up --debug`.*

## Usage

To begin, simply run `start.bat` for Windows, `start.command` for Mac OS X, or `start.sh` for Ubuntu. The box should start up within a minute. When it is done starting up, a browser window should appear showing Viscoll at `http://localhost:3000`. The default login credentials are `user@viscoll.com / goviscoll`. If you sign up additional users, you must visit `http://localhost:1080` to access the simulated confirmation email required for activating their accounts.

To end, simply run `stop.bat` for Windows, `stop.command` for Mac OS X, or `stop.sh` for Ubuntu.

*Command Line Usage: You can also start IIIF to Go using `vagrant up` and shut it down using `vagrant halt`. If you wish to see diagnostic output while the box is starting up, run `vagrant up --debug`.*

## SSH Access and the `viscoll` Shell Tool

While IIIF to Go is started, you can run administrative commands on it by running `ssh.bat` for Windows, `ssh.command` for Mac OS X, or `ssh.sh` for Ubuntu, or `vagrant ssh` from your command prompt.

Once you are logged into IIIF to Go, you can use the `viscoll` shell tool to manage the VisColl installation. Here is a list of commands (the default `sudo` credentials are `vagrant / vagrant`):

- `viscoll start`: Start VisColl. This command is automatically run on startup.
- `viscoll stop`: Stop VisColl.
- `viscoll test`: Run the tests for VisColl's back-end API, followed by the tests for VisColl's front-end app.
- `viscoll test-api`: Run the tests for VisColl's back-end API only.
- `viscoll test-app`: Run the tests for VisColl's front-end app only.
- `viscoll autotest-api`: Run the testing daemon for VisColl's back-end API.
- `viscoll autotest-app`: Run the testing daemon for VisColl's front-end app.
- `viscoll log`: Alias for `viscoll log-api`.
- `viscoll log-api`: Show the logs for the back-end API.
- `viscoll log-app`: Show the logs for the front-end app.

## Uninstallation

Run `uninstall.bat` if you use Windows, `uninstall.command` if you use Mac OS X or `uninstall.sh` if you use Ubuntu. This will remove the VirtualBox image generated during installation.

*Command Line Usage: You can uninstall IIIF to Go using `vagrant destroy`.*

## License

IIIF to Go (VisColl Version) is licensed under Apache License 2.0.
