require("luci.sys")

get_login_device_mac = function()
    local remote_ip = os.getenv("REMOTE_ADDR")
    if not remote_ip then return "" end

    local arp_cmd = "ip neigh show | grep '" .. remote_ip .. "' | awk '{print $5}'"
    return luci.sys.exec(arp_cmd):gsub("\n", ""):upper()
end

set_interface_mac = function(new_mac)
    luci.sys.call("uci set network.cfg050f15.macaddr=" .. new_mac .. " && uci commit network")
    luci.sys.call("ifconfig eth0.2 down && ifconfig eth0.2 hw ether " .. new_mac .. " && ifconfig eth0.2 up")
end

m = Map("brukamen_mac", translate("Brukamen MAC"), translate("Change MAC address of eth0.2 interface."))

s = m:section(TypedSection, "brukamen_mac", "")
s.addremove = false
s.anonymous = true

current_mac = s:option(DummyValue, "current_mac", translate("Current MAC"))
current_mac.value = luci.sys.exec("ifconfig eth0.2 | grep HWaddr | awk '{ print $5 }'"):gsub("\n","")

new_mac = s:option(Value, "new_mac", translate("New MAC"))

get_login_device_mac_btn = s:option(Button, "_get_login_device_mac")
get_login_device_mac_btn.title      = translate("Get Login Device MAC")
get_login_device_mac_btn.inputtitle = translate("Get Login MAC")
get_login_device_mac_btn.inputstyle = "apply"

get_login_device_mac_btn.write = function(self, section)
    local mac = get_login_device_mac()
    if mac ~= "" then
        set_interface_mac(mac)
        new_mac:write(section, mac)
        new_mac.datatype = "macaddr"
    end
end

return m
