//
//  LaunchAdManager.m
//  NewEBPP
//
//  Created by liyang on 15/9/7.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "LaunchAdManager.h"
#import "UIImageView+WebCache.h"

@interface LaunchAdManager()

@property (nonatomic, strong) UIImageView *adImageV;
@property (nonatomic, strong) UIView *adView;
@property (nonatomic, strong) NSString *loadUrl;
@property (nonatomic, assign) BOOL imgLoaded;

@end


@implementation LaunchAdManager

/******************************************************************************
 **** Custom  Method                                                       ****
 ******************************************************************************/
#pragma mark -
#pragma mark  Custom Method

- (void)showAdWithTimeInterval:(NSTimeInterval)interval
                      imageUrl:(NSString *)url
                        adView:(UIView *)adView
{
    self.adView = adView;
    self.loadUrl = url;
    while (!self.imgLoaded)
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate distantFuture]];
    }
    [self performSelector:@selector(dismiss)
               withObject:self
               afterDelay:interval];
}

-(void)dismiss
{
    [UIView animateWithDuration:0.5 animations:^{
        self.adView.alpha = 0;
    } completion:^(BOOL finished) {
        self.adView = nil;
        [self.adView removeFromSuperview];
    }];
}

/******************************************************************************
 **** KVO Handler Method                                                   ****
 ******************************************************************************/
#pragma mark -
#pragma mark KVO Handler Method

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (object != self) { return; }
    
    if ([keyPath isEqualToString:@"loadUrl"])
    {
        NSURL *url = [NSURL URLWithString:self.loadUrl];
        if (url == nil)
        {
            self.imgLoaded = YES;
            return ;
        }
        [self.adView addSubview:self.adImageV];
        
        /**
         *  注意1:
         *  通过SDWebImage来获取网络图片，它会通过url这个key来做缓存处理，如果下次加载的
         *  url和上次的一样，那么就会直接拿本地缓存的图片。
         *
         *  注意2:
         *  在SDWebImage下载完成后,一定要将imgLoaded这个Bool值置为YES,否则页面会一直卡在
         *  那里（可以这么理解：NSRunLoop会判断图片是否加载完成，如果加载完成就会继续执行，
         *  否则...）
         */
        [self.adImageV sd_setImageWithURL:url
                                completed:^(UIImage *image,
                                            NSError *error,
                                            SDImageCacheType cacheType,
                                            NSURL *imageURL)
         {
             self.imgLoaded = YES;
         }];
    }
}

/******************************************************************************
 **** Default Method                                                       ****
 ******************************************************************************/
#pragma mark -
#pragma mark  Default Method

- (UIImageView *)adImageV
{
    if (!_adImageV)
    {
        CGRect frame = [UIScreen mainScreen].bounds;
        _adImageV = [[UIImageView alloc] initWithFrame:frame];
        _adImageV.contentMode = UIViewContentModeScaleAspectFill;
        _adImageV.clipsToBounds = YES;
    }
    return _adImageV;
}


+ (LaunchAdManager *)shareManager
{
    static dispatch_once_t once;
    static LaunchAdManager *adManager = nil;
    dispatch_once(&once, ^{
        adManager = [[LaunchAdManager alloc]init];
    });
    
    return adManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addObserver:self
               forKeyPath:@"loadUrl"
                  options:(NSKeyValueObservingOptionNew |
                           NSKeyValueObservingOptionOld)
                  context:nil];
    }
    return self;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"loadUrl"];
}
@end
