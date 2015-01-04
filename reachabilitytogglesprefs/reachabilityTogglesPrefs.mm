#import <Preferences/Preferences.h>

@interface reachabilityTogglesPrefsListController: PSListController {
}
@end

@implementation reachabilityTogglesPrefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"reachabilityTogglesPrefs" target:self] retain];
	}
	return _specifiers;
}

-(void)respring {
  system("killall -9 backboardd");
}

-(void) sendEmail {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:ruslan.ardashev@duke.edu?subject=panicLockPro"]];
}

-(void) openInstructions {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.youtube.com/watch?v=9lxsVVEfLqg"]];
}

-(void) openYoutubeChannel {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.youtube.com/user/Ruslan120101"]];
}

@end

// vim:ft=objc
