var target = UIATarget.localTarget();
var appWindow = target.frontMostApp().mainWindow();


appWindow.tableViews()[0].cells()[0].tap();
appWindow.tableViews()[0].cells()[6].tap();

var toolBar = target.frontMostApp().toolbar();


toolBar.buttons()["Add Item"].tapWithOptions({tapCount:3});
appWindow.tableViews()[0].cells()[0].tap()
toolBar.buttons()["Reduce Item"].doubleTap();
target.frontMostApp().navigationBar().leftButton().tap();
