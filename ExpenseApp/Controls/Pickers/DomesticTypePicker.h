//
//  DomesticTypePicker.h
//  ExpenseApp
//
//  Created by Bert Outtier on 5/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DomesticTypePicker;
@protocol DomesticTypePickerDelegate <NSObject>
@optional
- (void)didSelectType:(int)type withName:(NSString*)name;
@required
@end

@interface DomesticTypePicker : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
{
	id <DomesticTypePickerDelegate> domesticTypePickerDelegate;
}
@property (nonatomic, assign) id <DomesticTypePickerDelegate> domesticTypePickerDelegate;
@property (nonatomic) int type;
@property (nonatomic, strong) NSString* typeName;
- (id)init:(id<DomesticTypePickerDelegate>)delegateObject;

@end
