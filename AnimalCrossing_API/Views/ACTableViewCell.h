//
//  ACTableViewCell.h
//  AnimalCrossing_API
//
//  Created by Consultant on 8/8/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACTableViewCell : UITableViewCell


@property (nonatomic, weak) UIImageView* AC_ImageView;
@property (nonatomic, weak) UILabel* NameLabel;
@property (nonatomic, weak) UILabel* catchPhraseLabel;
@property (nonatomic, weak) UILabel* idenfifier;
@end

NS_ASSUME_NONNULL_END
