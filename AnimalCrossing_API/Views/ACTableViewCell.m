//
//  ACTableViewCell.m
//  AnimalCrossing_API
//
//  Created by Consultant on 8/8/22.
//

#import "ACTableViewCell.h"
#import "AC_Model.h"

@implementation ACTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
    }
    
    return self;
}
// AC_ImageView
// NameLabel
-(void)setUp {
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
   // [imageView setImage:[UIImage imageNamed:@"question-mark"]];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setText:@"AnimalCrossingAnimals"];
    
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectZero];
    [label2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label2 setNumberOfLines:0];
    [label2 setText:@"catch-phrase"];
    
//    UILabel* label3 = [[UILabel alloc] initWithFrame:CGRectZero];
//    [label3 setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [label3 setNumberOfLines:0];
//    [label3 setText:@"identifier"];
    
    self.AC_ImageView = imageView;
    self.NameLabel = label;
    self.catchPhraseLabel = label2;
//    self.idenfifier = label3;
    
    [self.contentView addSubview:imageView];
    [self.contentView addSubview:label];
    [self.contentView addSubview:label2];
//    [self.contentView addSubview:label3];

    [[imageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8] setActive:YES];
    [[imageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:8] setActive:YES];
    [[imageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8] setActive:YES];
    
    [[imageView.heightAnchor constraintEqualToConstant:150] setActive:YES];
    [[imageView.widthAnchor constraintEqualToConstant:150] setActive:YES];
    
    [[label.leadingAnchor constraintEqualToAnchor:imageView.trailingAnchor constant:8] setActive:YES];
    [[label.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8] setActive:YES];
    [[[label topAnchor] constraintEqualToAnchor:self.contentView.topAnchor constant:8] setActive:YES];
    
    [[[label2 topAnchor] constraintEqualToAnchor:label.bottomAnchor constant:8] setActive:YES];
    [[label2.leadingAnchor constraintEqualToAnchor:imageView.trailingAnchor constant:8] setActive:YES];
     [[label2.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant: -8] setActive:YES];
    
    
//    [[[label3 topAnchor] constraintEqualToAnchor:label2.bottomAnchor constant:8] setActive:YES];
//    [[label3.leadingAnchor constraintEqualToAnchor:label2.trailingAnchor constant:8] setActive:YES];
//     [[label3.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant: -8] setActive:YES];
    
}



@end
