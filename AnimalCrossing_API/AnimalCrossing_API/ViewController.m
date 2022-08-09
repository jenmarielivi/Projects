//
//  ViewController.m
//  AnimalCrossing_API
//
//  Created by Consultant on 8/8/22.
//

#import "ViewController.h"
#import "NetworkManager.h"
#import "AC_Model.h"
#import "ACTableViewCell.h"
#import "AnimalCrossing_API-Swift.h"


@interface ViewController ()
@property (nonatomic, weak) UITableView* table;
@property (nonatomic, strong) ACViewModel* movieVM;

@end


@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setUP];
    [self.movieVM bindWithUpdateHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.table reloadData];
        });
    }];
    [self.movieVM fetchACPage];
    self.title = @"Animal Crossing";

//  [self.movieVM AC_ImageView];
  
}

-(void)setUP{
    self.movieVM = [[ACViewModel alloc] initWithNetworkManager:[NetworkManager sharedInstance]];
    
    UITableView* table = [[UITableView alloc] initWithFrame:CGRectZero];
    [table setTranslatesAutoresizingMaskIntoConstraints:NO];
    table.translatesAutoresizingMaskIntoConstraints = NO;
    [table setDataSource:self];
    [table setPrefetchDataSource:self];
    [table registerClass:[ACTableViewCell self] forCellReuseIdentifier:@"CellId"];
   
    self.table = table;
    [self.view addSubview:table];
    
    
    // Constraints
    [[table.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:8] setActive:YES];
    [[table.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:8] setActive:YES];
    [[table.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-8] setActive:YES];
    [[table.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-8] setActive:YES];
    
    [table setBackgroundColor:[UIColor systemTealColor]];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movieVM.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    ACTableViewCell* cell = (ACTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    if (cell == nil) {
        return [[UITableViewCell alloc] init];
    }
    
//    Movie* movie = (Movie*)[self.movies objectAtIndex:indexPath.row];

    
    [cell.NameLabel setText: [self.movieVM NameFor:indexPath.row]];
    [[cell catchPhraseLabel] setText:[self.movieVM catchPhraseFor:indexPath.row]];
//    [[cell idenfifier] setText:[self.movieVM identifierFor:indexPath.row]];

    //   [cell.NameLabel setText:[self.movieVM titleFor:indexPath.row]];
//
    [self.movieVM ACImageFor:indexPath.row completion:^(UIImage * _Nullable film) {        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.AC_ImageView setImage:film];
        });
    }];
    

    return cell;
}


- (void)tableView:(nonnull UITableView *)tableView prefetchRowsAtIndexPaths:(nonnull NSArray<NSIndexPath *> *)indexPaths {
    NSIndexPath* lastIndexPath = [NSIndexPath indexPathForRow:self.movieVM.count - 1 inSection:0];
    if ([indexPaths containsObject:lastIndexPath]) {
        [self.movieVM fetchACPage];
    }
}



@end

