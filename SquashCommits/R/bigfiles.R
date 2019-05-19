bigfiles =
function(dir = "~/Downloads", pattern = character(), ...,
          files = list.files(dir, pattern = pattern, full = TRUE, ...),
          info = file.info(files)) 
{
    info[order(info$size, decreasing = TRUE), c("size", "ctime"), drop = FALSE]
}


