-- Advanced: decrypt AES payload using Cocoa frameworks directly
use framework "Foundation"

set b64 to "..." -- encrypted payload
set key to "hunter2"

-- Decrypt NSData (left as an exercise, since full ObjC AES CBC requires many steps)
-- Idea: use NSData's initWithBase64EncodedString_ and CCCrypt from Security framework
