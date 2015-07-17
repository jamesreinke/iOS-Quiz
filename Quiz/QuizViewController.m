//
//  QuizViewController.m
//  
//
//  Created by James Reinke on 7/16/15.
//
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation QuizViewController

// initialization method
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // create two arrays filled with questions and answers and make pointers for them
        
        self.questions = @[@"From what is cognac made?",
                           @"What is 7*7?",
                           @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes",
                         @"49",
                         @"Montpelier"];
    }
    
    // return teh address of the new object
    return self;
}

// show question action
- (IBAction)showQuestion:(id)sender
{
    // step to the next question
    self.currentQuestionIndex++;
    
    // am i past the last question?
    if (self.currentQuestionIndex == [self.questions count]){
        
        //go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // get the string at the index in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // display the string in the question label
    self.questionLabel.text = question;
    
    // reset the answer label
    self.answerLabel.text = @"???";
}

// show answer action
- (IBAction)showAnswer:(id)sender
{
    // what is the answer to the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    // display it in the answer label
    self.answerLabel.text = answer;
}

@end
