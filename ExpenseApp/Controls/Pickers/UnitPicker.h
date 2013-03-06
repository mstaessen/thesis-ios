//
//  UnitPicker.h
//  ExpenseApp
//
//  Created by Bert Outtier on 4/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UnitPicker;
@protocol UnitPickerDelegate <NSObject>
@optional
- (void)didSelectUnit:(int)unit withName:(NSString*)name;
@required
@end

@interface UnitPicker : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
{
	id <UnitPickerDelegate> unitPickerDelegate;
}
@property (nonatomic, assign) id <UnitPickerDelegate> unitPickerDelegate;
@property (nonatomic) int unit;
@property (nonatomic, strong) NSString* unitName;
- (id)init:(id<UnitPickerDelegate>)delegateObject;

@end
