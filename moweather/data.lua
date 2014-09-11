data.moweather = true

data:extend(
{
{
    type = "explosion",
    name = "thunder-roll",
    flags = {"not-on-map"},
    animation_speed = 1,
    animations =
    {
      {
        filename = "__moweather__/graphics/empty.png",
        priority = "low",
        frame_width = 32,
        frame_height = 32,
        frame_count = 1
      }
    },   
	sound =
    {
      {
        filename = "__moweather__/sound/thunder1.ogg",
        volume = 0.6
      },
	  {
        filename = "__moweather__/sound/thunder2.ogg",
        volume = 0.6
      },
	  {
        filename = "__moweather__/sound/thunder3.ogg",
        volume = 0.6
      }
    },
    light = {intensity = 4, size = 100},
    smoke = "smoke-fast",
    smoke_count = 0,
    smoke_slow_down_factor = 1
  },
  {
    type = "explosion",
    name = "rain-loop",
    flags = {"not-on-map"},
    animation_speed = 5,
    animations =
    {
      {
        filename = "__moweather__/graphics/empty.png",
        priority = "low",
        frame_width = 32,
        frame_height = 32,
        frame_count = 1
      }
    },   
	sound =
    {
      {
        filename = "__moweather__/sound/rain.ogg",
        volume = 0.3
      }
    },
    light = {intensity = 0, size = 0},
    smoke = "smoke-fast",
    smoke_count = 0,
    smoke_slow_down_factor = 1
  },
  {
    type = "explosion",
    name = "rain-drops",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__moweather__/graphics/Rain/rain.png",
        priority = "low",
        frame_width = 200,
        frame_height = 200,
        frame_count = 6,
		animation_speed = 0.1
      },
	  {
        filename = "__moweather__/graphics/Rain/rain2.png",
        priority = "low",
        frame_width = 200,
        frame_height = 200,
        frame_count = 6,
		animation_speed = 0.1
      },
	  {
        filename = "__moweather__/graphics/Rain/rain3.png",
        priority = "low",
        frame_width = 200,
        frame_height = 200,
        frame_count = 6,
		animation_speed = 0.1
      }
    },
    light = {intensity = 0, size = 0},
    smoke = "smoke",
    smoke_count = 0,
    smoke_slow_down_factor = 1
  }
})
