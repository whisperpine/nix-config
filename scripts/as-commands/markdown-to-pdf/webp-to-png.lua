local tmpdir = assert(os.getenv "WEBP_TO_PNG_TMPDIR")
local counter = 0

local function to_png(src)
  if not src:lower():match "%.webp$" then
    return nil
  end
  counter = counter + 1
  local out = string.format("%s/%d.png", tmpdir, counter)
  pandoc.pipe("ffmpeg", { "-y", "-loglevel", "error", "-i", src, out }, "")
  return out
end

function Image(img)
  local out = to_png(img.src)
  if out then
    img.src = out
    return img
  end
end
