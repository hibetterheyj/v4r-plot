filename = '.\trn.txt'; % val trn
% [data1,data2,data3,data4]=textread(filename,'%n%n%n%n','delimiter', ',');
read_data = textread(filename,'%s');
num = max(size(read_data));
write_data = cell(num, 1);
% for i = 1:num
for i = 1 : num
    img_ext = '.jpg", ';
    mask_ext = '.png", ';
    data_st = '{"fpath_img": "aeroscapes/JPEGImages/';
    data_med = '"fpath_segm": "aeroscapes/SegmentationClass/';
    data_end = '"width": 1280, "height": 720}';
    write_data = [data_st read_data{i} img_ext data_med read_data{i} mask_ext data_end];
    fid=fopen('.\training.txt','a'); % validation training
    fprintf(fid,'%s\n',write_data);
    fclose(fid);
end

% Êä³ö¸ñÊ½
% {"fpath_img": "ADEChallengeData2016/images/training/ADE_train_00000001.jpg", 
% "fpath_segm": "ADEChallengeData2016/annotations/training/ADE_train_00000001.png", 
% "width": 683, "height": 512}