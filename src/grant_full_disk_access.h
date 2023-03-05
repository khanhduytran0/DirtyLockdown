#pragma once
#import <Foundation/Foundation.h>

/// Uses CVE-2022-46689 to grant the current app read/write access outside the sandbox.
void grant_full_disk_access(void (^_Nonnull completion)(NSError* _Nullable));
bool patch_installd(void);
bool patch_lockdownd(void (^completion)(NSString* _Nullable));
