// LongerMessage10 for iOS 10.
// Made by nathanaccidentally. Licensed under the MIT license.

static BOOL Enabled = YES;
static NSInteger lineAmount = 4; // Default.

%hook NCNotificationShortLookView

-(void)setMessageNumberOfLines:(NSUInteger)messageNumberOfLines {
	%orig(lineAmount);
}

%end

%ctor
{

NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.nathanaccidentally.longermessageprefs.plist"];

if(prefs) {
if([prefs objectForKey:@"isEnabled"]) {
		Enabled = [[prefs valueForKey:@"isEnabled"] boolValue];
	}

if([prefs objectForKey:@"lineAmount"]) {
		lineAmount = [[prefs objectForKey:@"lineAmount"] intValue];
	}

		[prefs release];
	}
}

// Should work. Thanks /u/thefowles1 for asking for this.