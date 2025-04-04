function Main()
LVS = gg.multiChoice({
"CHỨC NĂNG1",
"CHỨC NĂNG2",
"CHỨC NĂNG3",
"CHỨC NĂNG4",
"THOÁT"
}, nil,'Tiêu đề menu')
if LVS == nil then else
if LVS[1] == true then suu1() end
if LVS[2] == true then suu2() end
if LVS[3] == true then suu3() end
if LVS[4] == true then suu4() end
if LVS[5] == true then suu5() end
end
XGCK = -1
end
----Youtube:suu script
function suu1()

end
----Youtube:suu script
function suu2()

end
----Youtube:suu script
function suu3()

end
----Youtube:suu script
function suu4()

end
----Youtube:suu script
function suu5()
gg.alert("Youtube:sửu script")
os.exit()
end
while true do
if gg.isVisible(true) then
XGCK = 1
gg.setVisible(false)
end
gg.clearResults()
if XGCK == 1 then Main() end
end
