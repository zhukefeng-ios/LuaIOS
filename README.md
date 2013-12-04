LuaIOS
======

基于wax+lua的IOS插件开发
Objective-C的运行时支持新增类型和方法，但是由于苹果的限制，开发者无法在iOS上动态加载Objective-C原生代码，所以只能寻求替代方案。

脚本语言就可以一定程度上解决这一问题，一般情况下可以使用html+js实现例如支付宝的插件的实现就是用的是html+js技术，也可以基于lua脚本实现，下面介绍wax+lua的实现方式

关于wax请参见下面的连接

Wax项目（http://github.com/probablycorey/wax）

当然多数熟悉iOS的开发人员不一定会赞同采用这种开发方式，所以我们在引入Wax的同时希望能够和已有的iOS项目无缝的结合起来，不改变项目使用Objective-C开发的方式，在项目上线后通过Wax来改变程序运行时的行为。这样就可以避免漫长的AppStore上线审核，随时对线上程序进行调整，甚至是修复线上程序的问题或缺陷。



下面是IOS代码，这里是IOS列表的简单的几个接口的实现，其实只是写了一下接口，并没有实现具体的方法，只是为了和lua脚本做个比较

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;

}

 

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];

}

 

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath

{

}

 

下面是基于wax的lua代码，看上去和IOS原生方法有很多类似的地方，不过要注意lua特殊的语法格式，下面有风云翻译的lua教程可以参考学习

waxClass{"LIViewController",UITableViewController}

 

function viewDidLoad(self)

   print("viewDidLoad")

end

 

function tableView_numberOfRowsInSection(self, tableView,section)

    return 20;

end

 

function tableView_cellForRowAtIndexPath(self, tableView,indexPath)

      local cell =self:ORIGtableView_cellForRowAtIndexPath(tableView, indexPath)

      cell:textLabel():setText("".. indexPath:row())

      cell:detailTextLabel():setText("TESTDATA LUA  HUHUHU~~~")

      cell:textLabel():setTextColor(UIColor:redColor())

   print("cell num is :" .. indexPath:row())

    --if (1 ==indexPath:row()) then

       --print("OMG---------!!!!!!!")

    --end

      return cell

end

 

function tableView_didDeselectRowAtIndexPath(self,tableView, indexPath)

    print("you selected row num is : "..indexPath:row())

end

 

基于wax的lua使用并不复杂，下面就是一种很简单的实现方法

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions

{

    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    // Override point for customization after applicationlaunch.

    wax_start("init.lua", nil);

    self.viewController = [[LIViewController alloc] init];

    self.window.rootViewController = self.viewController;

    [self.window makeKeyAndVisible];

    return YES;

}

 

Lua脚本的编写方式和Objective-C有很多的相似支出，在方法和类名上都和iOS的原生框架保持了一致。iOS开发人员只需要略微了解一下Lua的语法，就可以编写对应的Lua补丁。更多的细节可以参见Wax项目的介绍：https://github.com/probablycorey/wax/wiki/Overview。

需要注意的是Wax项目本身不支持方法覆盖和从Objective-C反向调用Lua修改后的实例

lua语法参照

http://www.codingnow.com/2000/download/lua_manual.html
