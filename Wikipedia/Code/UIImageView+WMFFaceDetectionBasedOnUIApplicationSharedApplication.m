#import "UIImageView+WMFFaceDetectionBasedOnUIApplicationSharedApplication.h"
@import WMF;

NS_ASSUME_NONNULL_BEGIN

@implementation UIImageView (WMFFaceDetectionBasedOnUIApplicationSharedApplication)

- (void)wmf_setImageWithURL:(NSURL *)imageURL {
    [self wmf_setImageWithURL:imageURL
                  detectFaces:YES
                     optimize:YES
                      failure:^(NSError *error) {
                      }
                      success:^{
                      }];
}

- (void)wmf_setImageWithURL:(NSURL *)imageURL detectFaces:(BOOL)detectFaces optimize:(BOOL)optimize failure:(WMFErrorHandler)failure success:(WMFSuccessHandler)success {
    BOOL isActive = [[UIApplication sharedApplication] applicationState] == UIApplicationStateActive;
    [self wmf_setImageWithURL:imageURL detectFaces:detectFaces onGPU:isActive optimize:optimize failure:failure success:success];
}

- (void)wmf_setImageWithMetadata:(MWKImage *)imageMetadata detectFaces:(BOOL)detectFaces optimize:(BOOL)optimize failure:(WMFErrorHandler)failure success:(WMFSuccessHandler)success {
    BOOL isActive = [[UIApplication sharedApplication] applicationState] == UIApplicationStateActive;
    [self wmf_setImageWithMetadata:imageMetadata detectFaces:detectFaces onGPU:isActive optimize:optimize failure:failure success:success];
}

@end

NS_ASSUME_NONNULL_END
