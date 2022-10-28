-- import comment plugin safely
local setup, comment = pcall(require, "Comment")
if not setup then
	return
end

-- enable comment
comment.setup()


-- To comment single line -> gcc
-- To cmment a block -> gc<motion> eg. gc9j