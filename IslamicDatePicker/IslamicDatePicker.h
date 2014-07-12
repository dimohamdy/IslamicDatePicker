//
//  IslamicDatePicker.h
//  IslamicDatePicker
//
//  Created by binaryboy on 7/11/14.
//  Copyright (c) 2014 AhmedHamdy. All rights reserved.
//


#import <UIKit/UIKit.h>
@class GRPPickerData;
@protocol GRPPickerData <NSObject>
- (void)selectedGRPPickerData:(NSDictionary *)dic;
@end
@interface IslamicDatePicker : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UIPickerView *dataPickerView;
//define the delegate property
@property (nonatomic, unsafe_unretained) id<GRPPickerData> delegate;

- (id)initWithWithDictionary:(NSDictionary*)dic;


-(void)setStylePickerWithLableFontSize:(int)fontsize andWithLableFontName:(NSString*)fontName andWithLableColor:(UIColor*)lblColor andWithLableNumberOfLines:(int)lines andWithPickerBackGroundColor:(UIColor*)bgColor andWithPickerTintColor:(UIColor*)tint andWithViewHeight:(int)height;


@end
