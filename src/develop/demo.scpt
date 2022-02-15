#!/usr/bin/osascript -l JavaScript
function page(argument) {
	Application("Safari").activate()
	Application("System Events").processes["Safari"].click({at: [430,20]})
	Application("System Events").processes["Safari"].click({at: [430,102]})
}

function jsc(argument) {
	let device = "张朝杰的iPhone XS"
	let condition = {title: {_beginsWith: "tt"}}
	let jscs = Application("System Events").processes["Safari"].menuBars.menus["开发"].menuItems[device].menus.menuItems.whose(condition)
	for(i in jscs) jscs[i].click()
}

function test(argument) {
	let device = "张朝杰的iPhone XS"
	Application("Safari").activate()
	
	let condition1 = {_or: [{title: {"=": "page-frame.html"}}, {title: {_beginsWith: "ttt"}}]}
	let pages = Application("System Events").processes["Safari"].menuBars.menus["开发"].menuItems[device].menus.menuItems.whose(condition1)
	for(i in pages) pages[i].click()
	delay(1)
	
	let condition2 = {_and: [{name: {_beginsWith: "网页检查器"}}, {name: {_contains: device}}]}
	windows = Application("System Events").processes["Safari"].windows.whose(condition2)
	for(i in windows) {
		windows[i].position = [100,100]
		windows[i].size = [800,600]
	}
	delay(1)
	
	for(let i = 0; i < Application("System Events").processes["Safari"].windows.length; i++) {
		if (Application("System Events").processes["Safari"].windows[0].name().endsWith("page-frame.html")) {
			Application("System Events").processes["Safari"].click({at: [150, 685]})
			Application("System Events").keystroke("__bdp_path__")
			Application("System Events").keyCode(76)
		}
		Application("System Events").keystroke("`", {using: 'command down'})
		delay(0.2)
	}
}

function run(argument) {
	console.log("run")
	let device = "张朝杰的iPhone XS"
	let condition1 = {_or: [{title: {"=": "page-frame.html"}}, {title: {_beginsWith: "ttt"}}]}
	let pages = Application("System Events").processes["Safari"].menuBars.menus["开发"].menuItems[device].menus.menuItems.whose(condition1)
	for(i in pages) console.log(pages[i].name())
}