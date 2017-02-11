RYModel
==============
A sdk make Json transform to Model.

What can RYModel Do?
==============
* Json to Model
* Jsonstr to Model
* Jsons to Models
* Model to Json
* Models to Jsons

How to Use?
==============
### Json to Model
### 
      <# Base Model #>
      -------------------------------------------------------
            Model:
            @interface RYUser : NSObject
            @property (nonatomic, weak) NSString *name;
            @property (nonatomic, assign) int age;
            @property (nonatomic, assign) BOOL sex;
            @end 
            @implementation RYUser 
            @end

            Json:
            NSDictionary *aDic = @{@"name":@"resory",
                                   @"age":@(29),
                                   @"sex":@true,
                                   @"grade":@"A"};

            Transform: 
            RYUser *user = [RYUser ry_modelWithKeyValue:aDic];
            NSLog(@"%@,%d,%d",user.name,user.age,user.sex);
            // resory,29,1
      
      <# Model contain model #>
      -------------------------------------------------------
            Model:
            @interface RYUser : NSObject
            @property (nonatomic, weak) NSString *aName;
            @property (nonatomic, assign) int age;
            @property (nonatomic, assign) BOOL sex;
            @end 
            @implementation RYUser 
            @end
            
            @interface RYCourse : NSObject
            @property (nonatomic, strong)  NSArray<RYMath*> *math;
            @property (nonatomic, assign) CGFloat english;
            @end
            
            @interface RYMath : NSObject
            @property (nonatomic, assign) CGFloat geometry;
            @property (nonatomic, assign) CGFloat calculous;
            @end
            
            @implementation RYMath
            @end

            
            @implementation RYCourse
            @end

            Json:
            NSDictionary *aDic = @{@"name":@"resory",
                                 @"age":@(29),
                                 @"sex":@true,
                                 @"grade":@"A",
                                 @"course":@{
                                         @"math":@[
                                                 @{
                                                     @"geometry":@200.42,
                                                     @"calculous":@300
                                                     },
                                                 @{
                                                     @"geometry":@100.42,
                                                     @"calculous":@99
                                                     }
                                                 ],
                                         @"english":@(100)
                                         }}

              Transform: 
              RYUser *user = [RYUser ry_modelWithKeyValue:aDic];
              NSLog(@"%@,%d,%d,%@",user.aName,user.age,user.sex,user.course.english);
              //resory,29,1,99.500000                          
