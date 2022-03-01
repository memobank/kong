local helpers = require "spec.helpers"
local conf_loader = require "kong.conf_loader"

describe("Tracer PDK", function()
  local tracer

  lazy_setup(function()
    local conf = assert(conf_loader(nil, {
      plugins = "bundled",
    }))

    local kong_global = require "kong.global"
    _G.kong = kong_global.new()
    kong_global.init_pdk(kong, conf, nil)
    tracer = require("kong.pdk.tracer")
  end)

  it("test init", function()
    tracer.new()
  end)

end)
