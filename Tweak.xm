/////////////////////////////////////////////////////////////
//
// reachabilityUnlocked by Ruslan Ardashev
// Duke University, '15
// Copyright 2015
//
/////////////////////////////////////////////////////////////

#define FILE_PATH @"/var/mobile/Library/Preferences/com.ruslan.reachabilitytoggleprefs.plist"


@interface SBReachabilitySettings : NSObject
- (double)accessIntervalFromDisk:(NSString *)intervalName;
- (BOOL)accessBoolFromDisk:(NSString *)boolName;
- (unsigned)accessIntFromDiskForIdentifier:(NSString *)intName;
@end


%hook SBReachabilitySettings

%new(d)
- (double)accessIntervalFromDisk:(NSString *)intervalName {

	// NSLog(@"ra86: entered accessIntervalFromDisk");

    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:FILE_PATH];

	// NSLog(@"ra86: accessing prefs ");

	if ((prefs == nil) || (intervalName == nil)) {

		return 0.0;

	}

	else {

		// NSLog(@"ra86: non nil prefs,  accessIntervalFromDisk, %@", prefs);

		NSNumber *returnIntervalValue = [prefs objectForKey:intervalName];
		double returnDouble = [returnIntervalValue doubleValue];

		// NSLog(@"ra86: accessing prefs, returned :%f ", returnDouble);

		[prefs release];

		return returnDouble;

	}

}

%new(b)
- (BOOL)accessBoolFromDisk:(NSString *)boolName {

	// NSLog(@"ra86: entered accessIntervalFromDisk");

    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:FILE_PATH];

	// NSLog(@"ra86: accessing prefs ");

	if ((prefs == nil) || (boolName == nil)) {

		return NO;

	}

	else {

		// NSLog(@"ra86: non nil prefs,  accessIntervalFromDisk, %@", prefs);

		NSNumber *returnBoolValue = [prefs objectForKey:boolName];
		BOOL returnBOOL = [returnBoolValue boolValue];

		// NSLog(@"ra86: accessing prefs, returned :%f ", returnDouble);

		[prefs release];

		return returnBOOL;

	}

}

%new(@)
- (unsigned)accessIntFromDiskForIdentifier:(NSString *)intName {

	// NSLog(@"ra86: entered accessIntervalFromDisk");

    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:FILE_PATH];

	// NSLog(@"ra86: accessing prefs ");

	if ((prefs == nil) || (intName == nil)) {

		return 0;

	}

	else {

		// NSLog(@"ra86: non nil prefs,  accessIntervalFromDisk, %@", prefs);

		NSNumber *returnInteger = [prefs objectForKey:intName];
		unsigned int returnInt = [returnInteger intValue];

		// NSLog(@"ra86: accessing prefs, returned :%f ", returnDouble);

		[prefs release];

		return returnInt;

	}

}

- (double )tapToTapMaxInterval { 

	// NSLog(@"swizzling tapToTapMaxInterval ra86");

	double returnDouble = [self accessIntervalFromDisk:@"intervalValue"];

	if (returnDouble == 0.0) {

		return 0.290000;

	}

	else {

		// NSLog(@"swizzling tapToTapMaxInterval success %f", returnDouble);

		return returnDouble;

	}

}

- (float )mass { 

	if ([self accessBoolFromDisk:@"noAnimation"]) {

		return 6.0;

	}

	else {

		return %orig;

	}

}

- (double)reachabilityDefaultKeepAlive { 

	// NSLog(@"swizzling reachabilityDefaultKeepAlive ra86");

	double returnDouble = [self accessIntervalFromDisk:@"keepAlive"];

	if (returnDouble == 0.0) {

		return 8.0;

	}

	else {

		// NSLog(@"swizzling tapToTapMaxInterval success %f", returnDouble);

		return returnDouble;

	}

}

- (void)setNumberOfTapsForTapTrigger:(unsigned)numberOfTapsForTapTrigger { 

	// numTapsToActivate

	unsigned int numTapsToActivate = [self accessIntFromDiskForIdentifier:@"numTapsToActivate"];

	if (numTapsToActivate == 0) {

		// NSLog(@"ra86: nil array");

		%orig;

	}

	else {

		// NSLog(@"ra86: array: %@", numTapsToActivate);

		%orig(numTapsToActivate);

	}

}

%end









