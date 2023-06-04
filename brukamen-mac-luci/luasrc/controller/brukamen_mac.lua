module("luci.controller.brukamen_mac", package.seeall)

function index()
    entry({"admin", "services", "brukamen_mac"}, cbi("brukamen_mac"), _("Brukamen MAC"), 90)
end