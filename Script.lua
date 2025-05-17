-- DANH SÁCH KEY VÀ SỐ NGÀY
local keyList = {
    ["DANH007"] = 9999999999
}

-- LẤY THỜI GIAN HIỆN TẠI + TÍNH HẠN KEY
local function getTimestampAfterDays(days)
    local now = os.time()
    local expireDate = os.date("*t", now + days * 24 * 60 * 60)
    expireDate.hour = 23
    expireDate.min = 59
    expireDate.sec = 59
    return os.time(expireDate)
end

-- KIỂM TRA KEY
function checkKey()
    local input = gg.prompt({"🔑 NHẬP KEY:"}, nil, {"text"})
    if not input then os.exit() end

    local userKey = string.lower(input[1])
    local duration = keyList[userKey]

    if duration then
        local expire = getTimestampAfterDays(duration)
        local now = os.time()
        local timeLeft = expire - now

        if timeLeft > 0 then
            gg.alert("✅ KEY HỢP LỆ!\nThời hạn: " .. duration .. " ngày\nHết hạn lúc: " .. os.date("%d/%m/%Y %H:%M:%S", expire))
            -- Ghi key vào file lưu hoặc dùng tiếp trong script ở đây nếu cần
            return true
        else
            gg.alert("❌ KEY ĐÃ HẾT HẠN!")
            os.exit()
        end
    else
        gg.alert("❌ KEY KHÔNG HỢP LỆ!")
        os.exit()
    end
end

-- GỌI HÀM KIỂM TRA KEY
checkKey()

gg.toast("🚀 SCRIPT HACK SPEED KHỞI ĐỘNG...")

local label = "SPEED_HACK"
local speedList = {}

function hackSpeed()
    -- Nếu đã từng lưu, dùng lại
    speedList = gg.getListItems(label)
    if #speedList > 0 then
        local prompt = gg.prompt({"💬 NHẬP SPEED MỚI (FLOAT):"}, {"2.0"}, {"number"})
        if not prompt or not tonumber(prompt[1]) then return gg.alert("⚠️ DỮ LIỆU KHÔNG HỢP LỆ!") end
        local newSpeed = tonumber(prompt[1])
        for i, v in ipairs(speedList) do
            v.value = newSpeed
        end
        gg.setValues(speedList)
        gg.toast("✅ SPEED ĐÃ ĐỔI THÀNH: "..newSpeed)
        return
    end

    -- Nếu chưa từng lưu -> Tìm QWORD và edit float
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("7310280281569624064", gg.TYPE_QWORD)
    local res = gg.getResults(1)
    if #res == 0 then return gg.alert("❌ KHÔNG TÌM THẤY QWORD!") end

    -- Edit FLOAT tại địa chỉ QWORD
    local addr = res[1].address
    local prompt = gg.prompt({"💬 NHẬP GIÁ TRỊ SPEED (FLOAT):"}, {"2.0"}, {"number"})
    if not prompt or not tonumber(prompt[1]) then return gg.alert("⚠️ DỮ LIỆU KHÔNG HỢP LỆ!") end
    local speed = tonumber(prompt[1])

    local floatEntry = {
        address = addr,
        flags = gg.TYPE_FLOAT,
        value = speed,
        name = label
    }

    gg.setValues({floatEntry})
    gg.addListItems({floatEntry})
    gg.toast("✅ SPEED SET = "..speed)
end

function resetSpeed()
    local items = gg.getListItems(label)
    if #items > 0 then
        for i, v in ipairs(items) do
            v.value = 1
        end
        gg.setValues(items)
        gg.removeListItems(items)
        gg.toast("🔁 ĐÃ RESET SPEED VỀ 1")
    end
    gg.clearResults()
end

-- Menu
function main()
    local menu = gg.multiChoice({
        "⚡ HACK SPEED",
        "❌ THOÁT SCRIPT"
    }, nil, "📜 MENU BY THÀNH DANH")

    if menu == nil then return end
    if menu[1] then hackSpeed() end
    if menu[2] then
        resetSpeed()
        os.exit()
    end
end

-- Loop
while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        main()
    end
end
