bigfiles =
function(dir) 
{
    i = file.info(list.files(dir))
    i[order(i$size, decreasing = TRUE), c("size", "ctime"), drop = FALSE]
}


