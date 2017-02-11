RYModel
==============
A sdk make Json transform to Model.

What can RYModel Do?
==============
* <a href="#1F">Json to Model `[Class ry_modelWithKeyValue]`</a>
* <a href="#2F">Jsonstr to Model `[Class ry_modelWithKeyValueString]`</a>
* <a href="#3F">Jsons to Models `[Class ry_modelsWithKeyValues]`</a>
* <a href="#4F">Model to Json   `[obj ry_modelToKeyValue]`</a>
* <a href="#5F">Models to Jsons  `[obj ry_modelsToKeyValues]`</a>

How to Use?
==============

### <a name="1F">Json to Model</a>
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

### <a name="2F">Jsonstr to Model</a>
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

### <a name="3F">Jsons to Models</a>
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

### <a name="4F">Model to Json</a>
###
      Model:
      @interface RYUser : NSObject
      @property (nonatomic, weak) NSString *name;
      @property (nonatomic, assign) int age;
      @property (nonatomic, assign) BOOL sex;
      @end 
      @implementation RYUser 
      @end
      
      Transform:
      RYUser *tUser = [RYUser new];
      tUser.aName = @"Resory";
      tUser.age = 10;
      tUser.sex = YES;
      NSDictionary *tDic = [tUser ry_modelToKeyValue];
      NSLog(@"%@",tDic);
      // {name = Resory; age = 10; sex = 1;}

### <a name="5F">Models to Jsons</a>
###
      Model:
      @interface RYUser : NSObject
      @property (nonatomic, weak) NSString *name;
      @property (nonatomic, assign) int age;
      @property (nonatomic, assign) BOOL sex;
      @end 
      @implementation RYUser 
      @end
      
      Transform:
      RYUser *tUser = [RYUser new];
      tUser.aName = @"Resory";
      tUser.age = 10;
      tUser.sex = YES;
    
      RYUser *aUser = [RYUser new];
      aUser.aName = @"jack";
      aUser.age = 20;
      aUser.sex = NO;
    
      NSArray *uers = @[tUser,aUser];
      NSArray *dics = [uers ry_modelsToKeyValues];
      for (NSDictionary *dic in dics) {
         NSLog(@"%@",dic);
      }
      // {name = Resory;age = 10;sex = 1;}
      // {name = jack;age = 20;sex = 0;}
  

      
      
