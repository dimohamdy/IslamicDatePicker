//
//  IslamicDatePicker.m
//  IslamicDatePicker
//
//  Created by binaryboy on 7/11/14.
//  Copyright (c) 2014 AhmedHamdy. All rights reserved.
//

#import "IslamicDatePicker.h"

@implementation IslamicDatePicker{
    int count;
    NSDictionary *dictionary;
    NSMutableArray*pickers;
    UILabel*sharedLabel;
    
    int ftsize;
    NSString*ftName;
    UIColor *lblClr;
    int lnes;
    
    UIColor *bgClr;
    UIColor *tintClr;
    int high;
}
@synthesize dataPickerView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:@"IslamicDatePicker"
                                                          owner:self
                                                        options:nil];
        self = [ nibViews objectAtIndex: 0];
        

    }
    self.dataPickerView.dataSource=self;
    self.dataPickerView.delegate=self;
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(id)initWithWithDictionary:(NSDictionary*)dic
{
    
    
    self = [super init];
    dictionary=[NSDictionary dictionaryWithDictionary:dic];
    pickers=[[NSMutableArray alloc]init];
    if (self) {
        
        // Initialization code
        NSLog(@"%f",self.frame.size.width);
#define padding 10
        
        
        
    }
    self.dataPickerView.delegate=self;
    NSLog(@"%@",self.dataPickerView.delegate);
    
    return self;
}
- (void)changeDate:(UIDatePicker *)sender {
    NSLog(@"New Date: %@", sender.date);
}



//init the style of Cell
-(void)setStylePickerWithLableFontSize:(int)fontsize andWithLableFontName:(NSString*)fontName andWithLableColor:(UIColor*)lblColor andWithLableNumberOfLines:(int)lines andWithPickerBackGroundColor:(UIColor*)bgColor andWithPickerTintColor:(UIColor*)tint  andWithViewHeight:(int)height{
    ftsize=fontsize;
    ftName=fontName;
    lblClr=lblColor;
    lnes=lines;
    bgClr=bgColor;
    tintClr=tint;
    high=height;
    
}
//style for picker
-(UIPickerView*)setStyleForPicker:(UIPickerView*)pick{
    pick.backgroundColor=bgClr;
    pick.tintColor=tintClr;
    return pick;
    
}
//style for lable in picker
-(UILabel*)setStyleForLable:(UILabel*)lbl{
    
    [lbl setFont:[UIFont fontWithName:ftName size:ftsize]];
    [lbl setTextColor:lblClr];
    [lbl setNumberOfLines:lnes];
    return lbl;
    
}
#pragma mark - Picker DELEGATE  -

//custom view for pickerView
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel* pickerLable = (UILabel*)view;
    if (!pickerLable){
        pickerLable = [[UILabel alloc] init];
        //tView.numberOfLines=3;
        pickerLable.adjustsFontSizeToFitWidth = YES;
        //tView.minimumFontSize = 0;
        // Setup label properties - frame, font, colors etc
        pickerLable.textAlignment = NSTextAlignmentCenter;
        pickerLable.backgroundColor=[UIColor clearColor];
        //pickerLable=  [self setStyleForLable:pickerLable];
        
    }
    // Fill the label text here
    NSString*key=[[dictionary allKeys] objectAtIndex:component];
    NSArray*arrOfFeild=[dictionary objectForKey:key];
    
    NSString*value=[arrOfFeild objectAtIndex:row];
    pickerLable.text=value;
    return pickerLable;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return [dictionary count];// or the number of vertical "columns" the picker will show...
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    NSString*key=[[dictionary allKeys] objectAtIndex:component];
    NSArray*arrOfFeild=[dictionary objectForKey:key];
    
    
    return [arrOfFeild count]-1;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSMutableArray* objects=[[NSMutableArray alloc]init];
    for (int num=0; num< pickerView.numberOfComponents; num++) {
        NSString*key=[[dictionary allKeys] objectAtIndex:num];
        NSArray*arrOfFeild=[dictionary objectForKey:key];
        row = [pickerView selectedRowInComponent:num];
        [objects addObject:[arrOfFeild objectAtIndex:row]];
    }
    NSDictionary*dic=[NSDictionary dictionaryWithObjects:objects forKeys:[dictionary allKeys]];
    NSLog(@"%@",dic);
    [self.delegate selectedGRPPickerData:dic];
    
}
//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
//    return 200;
//}



@end

