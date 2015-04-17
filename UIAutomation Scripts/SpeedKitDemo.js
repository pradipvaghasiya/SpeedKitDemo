var target = UIATarget.localTarget();
var appWindow = target.frontMostApp().mainWindow();


appWindow.tableViews()[0].cells()[0].tap();
appWindow.tableViews()[0].cells()[6].tap();

var toolBar = target.frontMostApp().toolbar();


toolBar.buttons()["Add Item"].tap();
toolBar.buttons()["Add Item"].tap()

appWindow.tableViews()[0].cells()[0].tap()

toolBar.buttons()["Reduce Item"].tap();
toolBar.buttons()["Reduce Item"].tap();
toolBar.buttons()["Reduce Item"].tap();
toolBar.buttons()["Reduce Item"].tap();


target.captureScreenWithName( "screenshot1.png" );

target.frontMostApp().navigationBar().leftButton().tap();
target.frontMostApp().navigationBar().leftButton().tap();
