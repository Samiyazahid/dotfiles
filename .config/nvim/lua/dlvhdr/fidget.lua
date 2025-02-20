local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
  return
end

-- fidget.setup({})

-- fidget.setup({
--   text = {
--     spinner = "dots", -- animation shown when tasks are ongoing
--     done = "", -- character shown when all tasks are complete
--     commenced = "Started", -- message shown when task starts
--     completed = "Completed", -- message shown when task completes
--   },
--   align = {
--     right = true,
--     bottom = true,
--   },
--   timer = {
--     spinner_rate = 50, -- frame rate of spinner animation, in ms
--     fidget_decay = 2000, -- how long to keep around empty fidget, in ms
--     task_decay = 1000, -- how long to keep around completed task, in ms
--   },
--   window = {
--     relative = "editor", -- where to anchor, either "win" or "editor"
--     blend = 0, -- &winblend for the window
--     zindex = nil, -- the zindex value for the window
--   },
--   fmt = {
--     leftpad = true, -- right-justify text in fidget box
--     stack_upwards = true, -- list of tasks grows upwards
--     max_width = 0, -- maximum width of the fidget box
--     -- function to format fidget title
--     fidget = function(fidget_name, spinner)
--       return string.format("%s %s", spinner, fidget_name)
--     end,
--     -- function to format each task line
--     task = function(task_name, message, percentage)
--       return string.format("%s%s [%s]", message, percentage and string.format(" (%s%%)", percentage) or "", task_name)
--     end,
--   },
--   debug = {
--     logging = false, -- whether to enable logging, for debugging
--     strict = false, -- whether to interpret LSP strictly
--   },
-- })
