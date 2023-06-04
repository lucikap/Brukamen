module("luci.controller.Brukamen_WiFi", package.seeall)

function index()
    entry({"admin", "services", "Brukamen_WiFi"}, cbi("Brukamen_WiFi"), "Brukamen WiFi")
end