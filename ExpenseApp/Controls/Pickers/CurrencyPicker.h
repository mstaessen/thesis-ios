//
//  CurrencyPicker.h
//  ExpenseApp
//
//  Created by Bert Outtier on 5/03/13.
//  Copyright (c) 2013 Bert Outtier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CurrencyPicker;
@protocol CurrencyPickerDelegate <NSObject>
@optional
- (void)didSelectCurrency:(NSString*)currency;
@required
@end

@interface CurrencyPicker : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>
{
	id <CurrencyPickerDelegate> currencyPickerDelegate;
}
@property (nonatomic, assign) id <CurrencyPickerDelegate> currencyPickerDelegate;
@property (nonatomic, strong) NSString* currency;
- (id)init:(id<CurrencyPickerDelegate>)delegateObject;

@end
