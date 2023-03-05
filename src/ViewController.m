#import "ViewController.h"
#import "grant_full_disk_access.h"
#include <dlfcn.h>

@interface ViewController () {
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"DirtyLockdown";

    UITextView *view = [[UITextView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:view];

    self.navigationItem.rightBarButtonItems = @[
        [[UIBarButtonItem alloc] initWithTitle:@"Patch" style:UIBarButtonItemStyleDone target:self action:@selector(patch)],
    ];
}

- (void)patch {
    grant_full_disk_access(^(NSError* _Nullable error){
        UITextView *view = (id)self.view.subviews[0];
        if (error) {
            [view insertText:[NSString stringWithFormat:@"%@", error]];
            return;
        }
        patch_lockdownd(^(NSString *text){
            [view insertText:text];
            [view insertText:@"\n"];
        });
    });
}

@end
