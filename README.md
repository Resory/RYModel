RYModel
==============
A sdk make Json transform to Model.

What can RYModel Do?
==============
<a href="#5F">锚点5</a>

* Json to Model `[Class ry_modelWithKeyValue]`
* Jsonstr to Model `[Class ry_modelWithKeyValueString]`
* Jsons to Models `[Class ry_modelsWithKeyValues]`
* Model to Json   `[obj ry_modelToKeyValue]`
* Models to Jsons  `[obj ry_modelsToKeyValues]`

How to Use?
==============

<span id = "jump">跳转到这里：</span>
### Json to Model
### 
      <# Base use #>
      
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
      
            Model:
            @interface RYUser : NSObject
            @property (nonatomic, weak) NSString *name;
            @property (nonatomic, assign) int age;
            @property (nonatomic, assign) BOOL sex;
            @end
            @implementation RYUser 
            @end
            
            @interface RYCourse : NSObject
            @property (nonatomic, assign) CGFloat english;
            @end
            @implementation RYCourse
            @end

            Json:
            NSDictionary *aDic = @{
                                    @"name":@"resory",
                                    @"age":@(29),
                                    @"sex":@true,
                                    @"grade":@"A",
                                    @"course":@{
                                                      @"english":@(100)
                                               }
                                    }

              Transform: 
              RYUser *user = [RYUser ry_modelWithKeyValue:aDic];
              NSLog(@"%@,%d,%d,%f",user.name,user.age,user.sex,user.course.english);
              //resory,29,1,99.500000   
              
      <# Json name not map Model property name #>
            
            Model:
            @interface RYUser : NSObject
            @property (nonatomic, weak) NSString *aName;
            @property (nonatomic, assign) int age;
            @property (nonatomic, assign) BOOL sex;
            @end
            @implementation RYUser
            - (NSDictionary *)ry_modelMapPropertyNames
            {
                return @{@"aName":@"name"};
            }
            @end
            
            Json:
            NSDictionary *aDic = @{@"name":@"resory",
                                   @"age":@(29),
                                   @"sex":@true,
                                   @"grade":@"A"};
            
            Transform: 
            RYUser *user = [RYUser ry_modelWithKeyValue:aDic];
            NSLog(@"%@,%d,%d",user.aName,user.age,user.sex);
            // resory,29,1

### Jsonstr to Model
###
      Model:
      @interface RYUser : NSObject
      @property (nonatomic, weak) NSString *name;
      @property (nonatomic, assign) int age;
      @property (nonatomic, assign) BOOL sex;
      @end 
      @implementation RYUser 
      @end
      
      JsonString:
      NSString *jsonString = @"{\"name\":\"Resory\", \"sex\":true, \"age\":30}";
      
      Transform:
      RYUser *user = [RYUser ry_modelWithKeyValueString:jsonString];
      NSLog(@"%@,%d,%d",user.name,user.age,user.sex);
      // Resory,30,1

<a name="5F">1111111</href> 
### Jsons to Models
###
      Model:
      @interface RYUser : NSObject
      @property (nonatomic, weak) NSString *name;
      @property (nonatomic, assign) int age;
      @property (nonatomic, assign) BOOL sex;
      @end 
      @implementation RYUser 
      @end
      
      Jsons:
      NSDictionary *aDic = @{@"name":@"resory",
                           @"age":@(29),
                           @"sex":@true,
                           @"grade":@"A"};
      NSDictionary *bDic = @{@"name":@"jack",
                             @"age":@30,
                             @"sex":@false,
                             @"grade":@"D}
      NSArray *aArr = @[aDic,bDic];
      
      Transform:
      NSArray *users = [RYUser ry_modelsWithKeyValues:aArr];
      for (RYUser *user in users) {
          NSLog(@"%@,%d,%d",user.aName,user.age,user.sex);
      }
      // resory,29,1
      // jack,30,0

