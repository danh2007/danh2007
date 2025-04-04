-- Biến lưu menu trước đó
local menuStack = {}

function OpenMenu(menuFunc)
    table.insert(menuStack, menuFunc)
    menuFunc()
end

function BackMenu()
    if #menuStack > 1 then
        table.remove(menuStack) -- Xóa menu hiện tại
        menuStack[#menuStack]() -- Quay lại menu trước đó
    else
        Main() -- Nếu không còn menu nào thì về menu chính
    end
end

gg.alert("MUỐN HACK MINIGAME MỚI THÌ PHẢI TẮT CHỨC NĂNG Ở MINIGAME CŨ Ở DÒNG '❌TẮT TÍNH NĂNG❌' CÓ Ở MỖI MENU")

function Main()
    local MainMenu = gg.multiChoice({
        "📇 MENU RÚT ĐŨA 🥢",
        "📇 MENU RÚT THĂM 🎰",
        "❌ THOÁT"
    }, nil, '🔥 MENU BY THÀNH DANH')

    if MainMenu == nil then return end

    if MainMenu[1] then OpenMenu(MenuCon1) end
    if MainMenu[2] then OpenMenu(MenuCon2) end
    if MainMenu[3] then ExitScript() end
end

-- MENU CON 1
function MenuCon1()
    local SubMenu1 = gg.multiChoice({
        "⚙️ SETUP",
        "📂 MENU RÚT ĐŨA 🥢",
        "❌ TẮT TÍNH NĂNG",
        "⬅️ QUAY LẠI"
    }, nil, '📂 MENU BY THÀNH DANH')

    if SubMenu1 == nil then return end

    if SubMenu1[1] then ChucNang1A() end -- CHỨC NĂNG 1A
    if SubMenu1[2] then OpenMenu(MenuCon1B) end -- MENU CON 1B
    if SubMenu1[3] then xoacn() end
    if SubMenu1[4] then BackMenu() end
end

-- MENU CON 1B (Menu Con trong Menu Con 1)
function MenuCon1B()
    local SubMenu1B = gg.multiChoice({
        "🎯 TRÚNG 21",
        "🎯 TRÚNG 18",
        "🎯 TRÚNG 15",
        "🎯 TRÚNG 12",
        "🎯 TRÚNG 11",
        "🎯 TRÚNG 9",
        "⬅️ QUAY LẠI"
    }, nil, '📂 MENU BY THÀNH DANH')

    if SubMenu1B == nil then return end

    if SubMenu1B[1] then ChucNang1B1() end
    if SubMenu1B[2] then ChucNang1B2() end
    if SubMenu1B[3] then ChucNang1B3() end
    if SubMenu1B[4] then ChucNang1B4() end
    if SubMenu1B[5] then ChucNang1B5() end
    if SubMenu1B[6] then ChucNang1B6() end
    if SubMenu1B[7] then BackMenu() end
end

-- MENU CON 2
function MenuCon2()
    local SubMenu2 = gg.multiChoice({
        "⚙️ SETUP",
        "📂 MENU RÚT THĂM 🎰",
        "❌ TẮT CHỨC NĂNG",
        "⬅️ QUAY LẠI"
    }, nil, '📂 MENU CON 2')

    if SubMenu2 == nil then return end

    if SubMenu2[1] then ChucNang2A() end -- CHỨC NĂNG 2A
    if SubMenu2[2] then OpenMenu(MenuCon2B) end -- MENU CON 2B
    if SubMenu2[3] then xoacn() end
    if SubMenu2[4] then BackMenu() end
end

-- MENU CON 2B (Menu Con trong Menu Con 2)
function MenuCon2B()
    local SubMenu2B = gg.multiChoice({
        "🎰 25",  
        "🎰 30",  
        "🎰 35",  
        "🎰 40",  
        "🎰 45",  
        "🎰 50",  
        "🎰 55",  
        "🎰 60",  
        "🎰 65",  
        "🎰 70",  
        "🎰 75",  
        "🎰 80",
        "⬅️ QUAY LẠI"
    }, nil, '📂 MENU BY THÀNH DANH')

    if SubMenu2B == nil then return end
    if SubMenu2B[1] then ChucNang2B1() end  
    if SubMenu2B[2] then ChucNang2B2() end  
    if SubMenu2B[3] then ChucNang2B3() end  
    if SubMenu2B[4] then ChucNang2B4() end  
    if SubMenu2B[5] then ChucNang2B5() end  
    if SubMenu2B[6] then ChucNang2B6() end  
    if SubMenu2B[7] then ChucNang2B7() end  
    if SubMenu2B[8] then ChucNang2B8() end  
    if SubMenu2B[9] then ChucNang2B9() end  
    if SubMenu2B[10] then ChucNang2B10() end  
    if SubMenu2B[11] then ChucNang2B11() end  
    if SubMenu2B[12] then ChucNang2B12() end
    if SubMenu2B[13] then BackMenu() end
end

-- CÁC CHỨC NĂNG TRONG MENU
function ChucNang1A()
    -- Bước 1: Nhập bộ 3 số lần 1
    local a = gg.prompt({"ĐŨA 1:", "ĐŨA 2:", "ĐŨA 3:"}, nil, {"number", "number", "number"})

    if not a then
        gg.toast("🚫 HỦY")
        return
    end

    -- Tìm kiếm bộ 3 số lần 1 (bộ nhớ Anonymous)
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber(a[1]..";"..a[2]..";"..a[3].."::12", gg.TYPE_DWORD)
    gg.toast("🔍 XONG")

    -- Ẩn menu chờ người dùng mở lại GG lần 2
    gg.setVisible(false)
    gg.toast("CHUẨN BỊ SETUP LẦN ✌️")

    -- Chờ người dùng mở lại GG
    while true do
        if gg.isVisible(true) then
            gg.setVisible(false)
            break
        end
    end

    -- Bước 2: Nhập bộ 3 số lần 2
    gg.alert("SETUP LẦN ✌️")

    local b = gg.prompt({"ĐŨA 1:", "ĐŨA 2:", "ĐŨA 3:"}, nil, {"number", "number", "number"})

    if not b or not b[1] or not b[2] or not b[3] then
        gg.toast("🚫 HỦY!")
        return
    end

    -- Lọc dữ liệu từ kết quả tìm kiếm trước
    gg.refineNumber(b[1]..";"..b[2]..";"..b[3].."..12")
    gg.toast("✅ ĐÃ LỌC DỮ LIỆU!")

    -- Lưu lại danh sách giá trị
    local results = gg.getResults(100)
    gg.addListItems(results)
    gg.toast("💾 ĐÃ LƯU DỮ LIỆU")
end

function EditHackDua(value1, value2, value3)
    local results = gg.getListItems()
    if #results > 0 then
        for i = 1, #results do
            local index = (i - 1) % 3
            if index == 0 then results[i].value = value1 end
            if index == 1 then results[i].value = value2 end
            if index == 2 then results[i].value = value3 end
        end
        gg.setValues(results)
    end
end

function ChucNang1B1() 
    EditHackDua(7, 7, 7) 
end

function ChucNang1B2() 
    EditHackDua(6, 6, 6) 
end

function ChucNang1B3() 
    EditHackDua(5, 5, 5) 
end

function ChucNang1B4() 
    EditHackDua(4, 4, 4) 
end

function ChucNang1B5() 
    EditHackDua(4, 4, 3) 
end

function ChucNang1B6() 
    EditHackDua(3, 3, 3) 
end


function ChucNang2A()
gg.alert("SETUP LẦN ☝️")
 local a = gg.prompt({"NHẬP GIÁ TRỊ PHIẾU 1:"}, nil, {"number"})

if not a then 
    gg.toast("🚫 HỦY") 
    os.exit() 
end

-- Tìm kiếm giá trị đầu tiên (bộ nhớ Anonymous)
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber(a[1], gg.TYPE_DWORD)
gg.toast("🔍 XONG")

-- Ẩn menu chờ người dùng mở lại GG
gg.setVisible(false)
gg.toast("CHUẨN BỊ SETUP LẦN ✌️")

-- Chờ người dùng mở lại GG
while true do 
    if gg.isVisible(true) then 
        gg.setVisible(false) 
        break 
    end 
end

-- Bước 2: Nhập giá trị lọc
gg.alert("SETUP LẦN ✌️")
local b = gg.prompt({"NHẬP GIÁ TRỊ PHIẾU 2:"}, nil, {"number"})

if not b then 
    gg.toast("🚫 HỦY") 
    os.exit() 
end

-- Lọc dữ liệu từ kết quả tìm kiếm trước
gg.refineNumber(b[1])
gg.toast("✅ ĐÃ LỌC DỮ LIỆU")

-- Lưu lại danh sách giá trị
local results = gg.getResults(100)
gg.addListItems(results)
gg.toast("💾 ĐÃ LƯU DỮ LIỆU")
end

function EditValue(value)
    local results = gg.getListItems()
    if #results > 0 then
        for i = 1, #results do
            results[i].value = value
        end
        gg.setValues(results)
    end
end

function ChucNang2B1() 
    EditValue(25) 
end

function ChucNang2B2() 
    EditValue(30) 
end

function ChucNang2B3() 
    EditValue(35) 
end

function ChucNang2B4() 
    EditValue(40) 
end

function ChucNang2B5() 
    EditValue(45) 
end

function ChucNang2B6() 
    EditValue(50) 
end

function ChucNang2B7() 
    EditValue(55) 
end

function ChucNang2B8() 
    EditValue(60) 
end

function ChucNang2B9() 
    EditValue(65) 
end

function ChucNang2B10() 
    EditValue(70) 
end

function ChucNang2B11() 
    EditValue(75) 
end

function ChucNang2B12() 
    EditValue(80) 
end

function xoacn()
    gg.clearResults() -- Xóa kết quả tìm kiếm
    gg.removeListItems(gg.getListItems()) -- Xóa danh sách đã lưu
    gg.toast("❌ĐÃ TẮT CHỨC NĂNG ")
end

-- THOÁT SCRIPT
function ExitScript()
    os.exit()
end

-- VÒNG LẶP MENU CHÍNH
while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        if #menuStack == 0 then
            Main()
        else
            menuStack[#menuStack]()
        end
    end
end
