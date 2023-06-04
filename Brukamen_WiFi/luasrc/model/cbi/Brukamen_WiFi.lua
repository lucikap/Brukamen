m = Map("wireless", translate("Wi-Fi Settings"), translate("Configure Wi-Fi settings"))

s = m:section(TypedSection, "wifi-iface", translate("Wireless Interface"))
s.anonymous = true

o = s:option(Value, "ssid", translate("Wi-Fi Name"))
o.placeholder = "MyNetwork"

o = s:option(ListValue, "encryption", translate("Encryption Type"))
o:value("psk", translate("WPA/WPA2-PSK"))
o:value("none", translate("Not Encrypted"))
o.default = "none"

o = s:option(Value, "key", translate("Password"))
o.datatype = "wpakey"
o.password = true
o:depends("encryption", "psk")
o.validate = function(self, value)
    if #value < 8 then
        return nil, translate("Password must be at least 8 characters")
    end

    return value
end

return m
