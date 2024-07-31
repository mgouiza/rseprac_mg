# Build up filename
VarName= “Ozone_”
TimeStamp = "2001-01-01"   # this could be in the nc file
Frame = str("%04d"%simhour)
MetaData = VarName+TimeStamp+"_"+Frame
fname_out = Home+MetaData+".png"


# create the file
savefig(fname_out,bbox_inches="tight",pad_inches=0.0)

