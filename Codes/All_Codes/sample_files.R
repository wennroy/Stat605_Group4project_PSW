setwd("~/stat605/group4")
path = "tmp/birdsongWav/New_wav"

all_dirs = list.dirs(path)
all_files = list.files(path)
print(all_files)
count = numeric(length(all_files))
i = 1
for (file_dir in all_dirs[2:length(all_dirs)]){
  count[i] = length(list.files(file_dir))
  i = i + 1
}

sample_res = sample(30,sum(count), replace = TRUE)

copy_path = "~/stat605/group4/tmp/birdsongWav/Sample_wav"
i = 0
for (file_dir in all_dirs[2:length(all_dirs)]){
 file_names = list.files(file_dir)
 for (file_name in file_names){
   i = i + 1
   file.copy(from = paste0(file_dir,'/',file_name), to = paste0(copy_path,'/',sample_res[i]))
 }
}

all_dirs = list.dirs(copy_path)
all_files = list.files(copy_path)
print(all_files)
count = numeric(length(all_files))
i = 1
for (file_dir in all_dirs[2:length(all_dirs)]){
  count[i] = length(list.files(file_dir))
  i = i + 1
}
count
