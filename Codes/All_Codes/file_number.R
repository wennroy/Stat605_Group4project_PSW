setwd("~/stat605/group4")
path = "tmp/birdsongWav/train2_wav16k_00/"
all_dirs = list.dirs(path)
all_files = list.files(path)
print(all_files)
count = numeric(length(all_files))
i = 1
for (file_dir in all_dirs[2:length(all_dirs)]){
  count[i] = length(list.files(file_dir))
  i = i + 1
}

all_files[which(count>200)]

