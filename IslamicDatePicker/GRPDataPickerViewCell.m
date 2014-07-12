//
//  GRPDataPickerViewCell.m
//  
//
//  Created by Ahmed Hamdy on 6/1/14.
//  Copyright (c) 2014 Ahmed Hamdy. All rights reserved.
//

#import "GRPDataPickerViewCell.h"

@implementation GRPDataPickerViewCell{
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
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:@"GRPDataPickerViewCell"
                                                          owner:self
                                                        options:nil];
        self = [ nibViews objectAtIndex: 0];

        

    }
    self.dataPickerView.dataSource=self;
    self.dataPickerView.delegate=self;
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}



- (id)initWithWithDictionary:(NSDictionary*)dic
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
        pickerLable.backgroundColor=[UIColor blueColor];
        pickerLable=  [self setStyleForLable:pickerLable];
        
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
    
    NSString*key=[[dictionary allKeys] objectAtIndex:pickerView.tag];
    NSArray*arrOfFeild=[dictionary objectForKey:key];
    
    
    return [arrOfFeild count];
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
